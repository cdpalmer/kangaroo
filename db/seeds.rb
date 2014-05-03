# Theatre.all.destroy_all
Theatre.create(
  zip_code: 80222,
  title: 'Regal Continental Stadium',
  address: '3635 S Monaco Pkwy'
)
Theatre.create(
  zip_code: 80222,
  title: 'Elvis Theatres',
  address: '1234 Hampden'
)
Theatre.create(
  zip_code: 51535,
  title: 'AMC Griswold',
  address: '310 Harrison Street'
)

# Movie.all.destroy_all
Movie.create(
  title: 'Heat',
  description: 'Hilarious movie with Sandra Bullock and Milissa McCarthy',
  duration: 93,
  theatre_id: Theatre.where(title: 'Elvis Theatres').first.id
)
Movie.create(
  title: 'Oceans 11',
  description: 'A group of eleven individuals plan and execute a huge heist on a Las Vegas casino',
  duration: 102,
  theatre_id: Theatre.where(title: 'Regal Continental Stadium').first.id
)
Movie.create(
  title: 'Oceans 12',
  description: 'The Oceans 11 group gets in trouble after their Vegas heist.',
  duration: 112,
  theatre_id: Theatre.where(title: 'Regal Continental Stadium').first.id
)
