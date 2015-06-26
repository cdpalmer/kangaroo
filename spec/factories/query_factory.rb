require 'ffaker'

FactoryGirl.define do
  factory :query do
    zipcode { FFaker::AddressUS.zip_code }
  end
end
