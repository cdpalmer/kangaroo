# require '../app/helpers/application_helper'
require 'spec_helper'

describe ApplicationHelper do
  describe '#determine_end_time' do
    it 'returns correct end_time' do
      duration = 63
      movie_end = helper.determine_end_time( Time.new(2014, 9, 6, 10, 30), duration )
      expect(movie_end).to eq( Time.new(2014, 9, 6, 11, 33) )
    end
  end
end
