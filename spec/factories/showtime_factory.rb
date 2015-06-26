require 'ffaker'

FactoryGirl.define do
  factory :showtime do
    start_time { Time.at((1410000000..1410190300).to_a.sample) }
  end
end
