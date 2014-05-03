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
    zip_endpoint = "?startDate=#{today}&zip=#{zip}&api_key=zwhkp5tk7wenzuvmnavq5f8k"
    output = @connection.get zip_endpoint
    output.body
  end

  def parse_zipcode_payload(payload)
    begin
      JSON.parse(payload).each do |movie|
        movie['showtimes'].each do |showtime|
          if Theatre.where(remote_id: showtime['theatre']['id']).empty?
            Theatre.create(remote_id: showtime['theatre']['id'], title: showtime['name'])
          end
        end

        # This is until I get the showtime model created, so each movie
        # will only be linked to the last theatre created
        tid = Theatre.last.id

        Movie.create(title: movie['title'], description: movie['shortDescription'], duration: 92, theatre_id: tid)
      end
    rescue MultiJson::LoadError => error
      raise error
    end
  end
end
