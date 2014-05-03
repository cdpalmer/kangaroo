require 'spec_helper'

describe MovieService do
  describe '#parse_zipcode_payload' do
    let(:onconnect_payload) { WebmockOnconnectResponse.zipcode_response(80222) }

    before :each do
      output = subject.parse_zipcode_payload(onconnect_payload)
      binding.pry

      output = output
    end

    it 'creates the correct movies' do
      expect(Movies.count).to eq(10)
    end

    it 'creates the correct movies' do
      expect(Theatres.count).to eq(8)
    end
  end
end
