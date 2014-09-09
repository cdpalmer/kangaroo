class ShowtimesController < ApplicationController
  def index
    @showtimes = Showtime.all.sort_by { |s| s.movie_id }
  end
end
