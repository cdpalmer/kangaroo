class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @movie_service = MovieService.new
    if Movie.count < 10
      output = @movie_service.find_by_zipcode(80222)
      @movie_service.parse_zipcode_payload(output)
    end
  end

  def show
    @movie = Movie.where(id: params[id])
  end
end
