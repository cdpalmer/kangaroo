require 'ffaker'

FactoryGirl.define do
  factory :movie do
    title { FFaker::Company.name }
    duration { Random.rand(80..121) }
  end
end
