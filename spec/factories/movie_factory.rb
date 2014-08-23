FactoryGirl.define do
  factory :movie do
    title { Faker::Company.name }
    duration { Random.rand(80..121) }
  end
end
