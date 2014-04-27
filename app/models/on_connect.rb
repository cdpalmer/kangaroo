class OnConnect
  require 'net/http'

  def initialize
    @endpoint = "http://data.tmsapi.com/v1/movies/showings/"
    @connection = Faraday.new(url: @endpoint) do |faraday|
      faraday.request   :url_encoded
      # faraday.response  :logger
      faraday.adapter   Faraday.default_adapter
    end
  end

  def find_by_zipcode(zip)
    # uri = @endpoint + "?zip=#{zip}&api_key=zwhkp5tk7wenzuvmnavq5f8k"
    today = Date.today.strftime("%Y-%m-%d")
    zip_endpoint = "?startDate=#{today}&zip=#{zip}&api_key=zwhkp5tk7wenzuvmnavq5f8k"
    output = @connection.get zip_endpoint
    output.body
  end
end
