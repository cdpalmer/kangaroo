class OnConnect
  require 'net/http'

  def initialize
    @endpoint = "http://data.tmsapi.com/v1/movies/showings/"
  end

  def find_by_zipcode(zip)
    output = Net::HTTP.get(@endpoint + "?zip=#{zip}&api_key=zwhkp5tk7wenzuvmnavq5f8k")
    output
  end
end
