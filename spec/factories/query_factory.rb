FactoryGirl.define do
  factory :query do
    zipcode { Faker::AddressUS.zip_code }
  end
end
