t1 = Theatre.create(
  zip_code: 80222,
  title: 'Regal Continental Stadium',
  address: '3635 S Monaco Pkwy'
)
t2 = Theatre.create(
  zip_code: 80222,
  title: 'Elvis Theatres',
  address: '1234 Hampden'
)
t3 = Theatre.create(
  zip_code: 51535,
  title: 'AMC Griswold',
  address: '310 Harrison Street'
)

m1 = Movie.create(
  title: 'Heat',
  description: 'Hilarious movie with Sandra Bullock and Milissa McCarthy',
  duration: 93
)
m2 = Movie.create(
  title: 'Oceans 11',
  description: 'A group of eleven individuals plan and execute a huge heist on a Las Vegas casino',
  duration: 102
)
m3 = Movie.create(
  title: 'Oceans 12',
  description: 'The Oceans 11 group gets in trouble after their Vegas heist.',
  duration: 112
)

Showtime.create(
  theatre_id: t1.id,
  movie_id: m1.id
)

Showtime.create(
  theatre_id: t1.id,
  movie_id: m2.id
)

Showtime.create(
  theatre_id: t1.id,
  movie_id: m3.id
)

Showtime.create(
  theatre_id: t2.id,
  movie_id: m2.id
)

Showtime.create(
  theatre_id: t3.id,
  movie_id: m1.id
)

Showtime.create(
  theatre_id: t3.id,
  movie_id: m3.id
)
