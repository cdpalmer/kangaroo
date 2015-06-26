require 'spec_helper'

describe QueriesController do
  describe 'POST create' do
    let(:local_zip) { FFaker::AddressUS.zip_code }

    it 'only creates new query if it does not exist' do
      Query.create(zip_code: local_zip)

      expect {
          post :create, query: { zip_code: local_zip }
        }.not_to change { Query.count }
    end

    it 'only checks queries for today'

    it 'redirects to showtimes on that query'
  end
end
