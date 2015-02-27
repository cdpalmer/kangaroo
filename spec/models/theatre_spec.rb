require 'spec_helper'

describe Theatre do
  describe '#marathons' do
    let!(:theatre) { FactoryGirl.create(:theatre) }
    let!(:movie_1) { FactoryGirl.create(:movie, duration: 90) }
    let!(:movie_2) { FactoryGirl.create(:movie, duration: 90) }
    let!(:movie_3) { FactoryGirl.create(:movie, duration: 90) }
    let!(:movie_4) { FactoryGirl.create(:movie, duration: 90) }
    let!(:showtime_1) {
      FactoryGirl.create(:showtime,
                         start_time: Time.new(2014, 9, 9, 13, 0).to_i,
                         theatre_id: theatre.id,
                         movie_id: movie_1.id)
    }
    let!(:showtime_2) {
      FactoryGirl.create(:showtime,
                         start_time: Time.new(2014, 9, 9, 11, 30).to_i,
                         theatre_id: theatre.id,
                         movie_id: movie_2.id)
    }
    let!(:showtime_3) {
      FactoryGirl.create(:showtime,
                         start_time: Time.new(2014, 9, 9, 10, 0).to_i,
                         theatre_id: theatre.id,
                         movie_id: movie_3.id)
    }
    let!(:showtime_4) {
      FactoryGirl.create(:showtime,
                         start_time: Time.new(2014, 9, 9, 8, 0).to_i,
                         theatre_id: theatre.id,
                         movie_id: movie_4.id)
    }

    it 'returns all marathons' do
      output = theatre.marathons
      expected = [[showtime_3, showtime_2, showtime_1],
                  [showtime_2, showtime_1],
                  [showtime_3, showtime_2]]

      # expect the array intersection to equal all items in expected
      expect( (output & expected).count ).to eq( expected.count )
    end
  end
end
