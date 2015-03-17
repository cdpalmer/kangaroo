class QueriesController < ApplicationController
  http_basic_authenticate_with name: 'cody', password: 'palmer'

  def index
    # Pull all queries from db
  end

  def create
    # Create new query in db and run query against movie service endpoint
    # @movie_service = MovieService.new
    # output = @movie_service.find_by_zipcode(80222)
    # @movie_service.parse_zipcode_payload(output)
    # -- Or run against mocked response for local debugging --
    # @movie_service.parse_zipcode_payload(WebmockOnconnectResponse.zipcode_response(80222))
  end
end
