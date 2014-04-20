class Movie < ActiveRecord::Base
  has_one :theatres
end
