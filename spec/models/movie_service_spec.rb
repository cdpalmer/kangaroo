require 'spec_helper'

describe MovieService do
  describe '#parse_zipcode_payload' do
    let(:onconnect_payload) { WebmockOnconnectResponse.zipcode_response(80222) }

    before :each do
      subject.parse_zipcode_payload(onconnect_payload)
    end

    it 'creates the correct movies' do
      expect(Movie.count).to eq(10)
    end

    it 'creates the correct theatres' do
      expect(Theatre.count).to eq(7)
    end
  end
end
