FactoryGirl.define do
  factory :response do
    content { Faker::Lorem.sentence(1) }
  end
end
