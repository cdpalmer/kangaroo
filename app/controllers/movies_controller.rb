require './spec/support/webmock_onconnect_responses.rb'

class MoviesController < ApplicationController
  def index
    @movie_service = MovieService.new
    # output = @movie_service.find_by_zipcode(80222)
    # @movie_service.parse_zipcode_payload(output)
    @movie_service.parse_zipcode_payload(WebmockOnconnectResponse.zipcode_response(80222))
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
