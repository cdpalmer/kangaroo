class MoviesController < BaseController
  respond_to :html

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.where(id: params[id])
  end
end
