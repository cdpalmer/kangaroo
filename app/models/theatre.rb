class Theatre < ActiveRecord::Base
  has_many :movies, through: :showtimes
  has_many :showtimes
end
