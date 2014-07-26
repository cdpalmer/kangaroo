require './spec/support/webmock_onconnect_responses.rb'

class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @movie_service = MovieService.new
    @movie_service.parse_zipcode_payload(WebmockOnconnectResponse.zipcode_response(80222))
  end

  def show
    @movie = Movie.where(id: params[id])
  end
end
