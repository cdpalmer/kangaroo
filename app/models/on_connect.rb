class OnConnect
  require 'net/http'

  def initialize
    @endpoint = "http://data.tmsapi.com/v1/movies/showings/"
    @connection = Faraday.new(url: @endpoint) do |faraday|
      faraday.request   :url_encoded
      faraday.adapter   Faraday.default_adapter
    end
  end

  def find_by_zipcode(zip)
    today = Date.today.strftime("%Y-%m-%d")
    radpar = "25"
    zip_endpoint = "?startDate=#{today}&zip=#{zip}&radius=#{radius}&units=mi&api_key=zwhkp5tk7wenzuvmnavq5f8k"
    output = @connection.get zip_endpoint
    output.body
  end

  def parse_zipcode_payload(payload)
    begin
      JSON.parse(payload).each do |movie|
        mov = Movie.find_or_create_by(title: movie['title'],
                     description: movie['shortDescription'],
                     duration: calc_movie_length(movie['runTime']))
        movie['showtimes'].each do |showtime|
          tid = showtime['theatre']['id']

          Theatre.find_or_create_by(id: tid, title: showtime['theatre']['name'])
          Showtime.find_or_create_by(theatre_id: tid,
                                     movie_id: mov.id,
                                     start_time: 'not important')
        end
      end
    rescue MultiJson::LoadError => error
      raise error
    end
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
