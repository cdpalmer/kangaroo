require 'spec_helper'

describe OnConnect do
  describe '#parse_zipcode_payload' do
    let(:onconnect_payload) { WebmockOnconnectResponse.zipcode_response(80222) }
    let(:webmock_titles) {
      [
        "300: Rise of an Empire",
        "A Haunted House 2",
        "Bears",
        "Brick Mansions",
        "Captain America: The Winter Soldier",
        "Cesar Chavez",
        "Divergent",
        "Dom Hemingway",
        "Draft Day"
      ].sort
    }
    let(:webmock_theatres) {
      [
        "Elvis Cinemas Tiffany Plaza",
        "Continental Stadium 10 & RPX",
        "AMC Cherry Creek 8",
        "Regal River Point Stadium 14",
        "UA Colorado Center Stadium 9 & IMAX",
        "Mayan Theatre",
        "Greenwood Village"
      ].sort
    }

    before :each do
      subject.parse_zipcode_payload(onconnect_payload)
    end

    it 'creates the correct movies' do
      processed_movie_titles = Movie.all.map(&:title)

      expect( Movie.count ).to eq(webmock_titles.count)
      expect( processed_movie_titles.sort ).to eq(webmock_titles)
    end

    it 'creates the correct theatres' do
      processed_movie_theatres = Theatre.all.map(&:title)

      expect( Theatre.count ).to eq(webmock_theatres.count)
      expect( processed_movie_theatres.sort ).to eq(webmock_theatres)
    end

    it 'creates the correct showtimes' do
      processed_showtimes = Showtime.all

      expect( processed_showtimes.count ).to eq(99)
    end
  end

  describe '#calc_movie_length' do
    it 'calculates and sets movie length' do
      example_run_time  = 'PT01H34M'
      output = subject.calc_movie_length(example_run_time)

      expect( output ).to eq 94
    end
  end
end
