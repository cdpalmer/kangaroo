class Theatre < ActiveRecord::Base
  has_many :movies, through: :showtimes
  has_many :showtimes

  def marathons
    [Showtime.first, Showtime.last]
  end
end
