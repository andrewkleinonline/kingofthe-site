FactoryGirl.define do
  factory :prompt do
    content { Faker::Lorem.sentence }
  end
end
