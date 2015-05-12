require 'spec_helper'

describe QueriesController do
  describe 'POST create' do
    let(:local_zip) { Faker::AddressUS.zip_code }

    it 'only creates new query if it does not exist' do
      expect { post :create, query: { zip_code: local_zip } }.to change { Query.count }.by 1
    end

    it 'only checks queries for today'

    it 'redirects to showtimes on that query'
  end
end
