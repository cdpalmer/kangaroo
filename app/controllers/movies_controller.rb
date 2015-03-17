require './spec/support/webmock_onconnect_responses.rb'

class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
