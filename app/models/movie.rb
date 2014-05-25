class Movie < ActiveRecord::Base
  has_many :theatres, through: :showtimes
  has_many :showtimes
end
