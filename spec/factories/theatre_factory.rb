require 'ffaker'

FactoryGirl.define do
  factory :theatre do
    title { FFaker::Name.first_name }
  end
end
