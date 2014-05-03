class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @movie_service = MovieService.new
    output = @movie_service.find_by_zipcode(80222)
    @movie_service.parse_zipcode_payload(output)
  end

  def show
    @movie = Movie.where(id: params[id])
  end
end
