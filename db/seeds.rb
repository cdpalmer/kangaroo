# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Movie.create(
  title: 'Heat',
  description: 'Hilarious movie with Sandra Bullock and Milissa McCarthy',
  duration: 93
)
Movie.create(
  title: 'Oceans 11',
  description: 'A group of eleven individuals plan and execute a huge heist on a Las Vegas casino',
  duration: 102
)
Movie.create(
  title: 'Oceans 12',
  description: 'The Oceans 11 group gets in trouble after their Vegas heist.',
  duration: 112
)

