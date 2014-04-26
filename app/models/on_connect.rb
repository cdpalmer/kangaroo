class OnConnect
  require 'net/http'

  def initialize
    @endpoint = "http://data.tmsapi.com/v1/movies/showings/"
  end

  def find_by_zipcode(zip)
    uri = @endpoint + "?zip=#{zip}&api_key=zwhkp5tk7wenzuvmnavq5f8k"
    output = Net::HTTP.get(uri)
    output
  end
end
