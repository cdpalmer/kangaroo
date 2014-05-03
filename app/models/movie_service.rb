class MovieService
  def initialize(service = Kangaroo::Application.config.remote_movie_service)
    @remote_movie_service = service
  end

  def find_by_zipcode(zipcode)
    @remote_movie_service.find_by_zipcode(zipcode)
  end

  def parse_zipcode_payload(payload)
    JSON.parse(payload).fetch('title')
  end
end
