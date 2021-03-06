class OnConnect
  require 'net/http'

  def initialize
    @endpoint = "http://data.tmsapi.com/v1.1/movies/showings/"
    @connection = Faraday.new(url: @endpoint) do |faraday|
      faraday.request   :url_encoded
      faraday.adapter   Faraday.default_adapter
    end
  end

  def find_by_zipcode(zip)
    today = Date.today.strftime("%Y-%m-%d")
    radius = "25"
    zip_endpoint = "?startDate=#{today}&zip=#{zip}&radius=#{radius}&units=mi&api_key=#{ENV["ONCONNECT_KEY"]}"
    output = @connection.get zip_endpoint
    output.body
  end

  def parse_zipcode_payload(payload, zip)
    begin
      payload_movies = []
      payload_theatres = []
      z = Zipcode.find_or_create_by(value: zip.to_s)
      JSON.parse(payload).each do |movie|
        unless payload_movies.include?(movie['title'])
          payload_movies << movie['title']
          mov = Movie.find_or_create_by(title: movie['title'],
                       description: movie['shortDescription'],
                       duration: calc_movie_length(movie['runTime']))
        end

        movie['showtimes'].each do |showtime|
          tid = showtime['theatre']['id']
          unless payload_theatres.include?(tid)
            payload_theatres << tid
            t = Theatre.find_or_create_by(id: tid,
                          title: showtime['theatre']['name'])
            t.zipcodes << z unless t.zipcodes.include?(z)
            z.theatres << t
          end
          Showtime.find_or_create_by(theatre_id: tid,
                                     movie_id: mov.id,
                                     start_time: calc_time_from_epoch(showtime['dateTime']))
        end
      end
    rescue MultiJson::LoadError => error
      raise error
    end
  end

  def calc_time_from_epoch(timestamp)
    year_block = /\d{4}-/
    year_format = /\d{4}/
    year = timestamp[year_block][year_format]
    month_block = /-\d+-/
    month_format = /\d+/
    month = timestamp[month_block][month_format]
    day_block = /-\d+T/
    day_format = /\d+/
    day = timestamp[day_block][day_format]
    hour_block = /T\d+/
    hour_format = /\d+/
    hour = timestamp[hour_block][hour_format]
    minute_block = /:\d+/
    minute_format = /\d+/
    minute = timestamp[minute_block][minute_format]

    Time.new(year, month, day, hour, minute).to_i
  end

  def calc_movie_length(runtime)
    if runtime
      hour_block = /\d{2}H/
      hour_digit = /\d{2}/
      hours = runtime[hour_block][hour_digit]
      minute_block = /\d{2}M/
      minute_digit = /\d{2}/
      minutes = runtime[minute_block][minute_digit]
      hours.to_i * 60 + minutes.to_i
    else
      'n/a'
    end
  end
end
