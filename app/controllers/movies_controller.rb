class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @movie_service = MovieService.new
  end

  def show
    @movie = Movie.where(id: params[id])
  end
end
