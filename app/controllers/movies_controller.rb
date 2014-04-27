class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @movie_service = MovieService.new
    @output = @movie_service.find_by_zipcode(80222)
  end

  def show
    @movie = Movie.where(id: params[id])
  end
end
