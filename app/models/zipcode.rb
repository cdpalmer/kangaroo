class Zipcode < ActiveRecord::Base
  has_and_belongs_to_many :theatres
end
