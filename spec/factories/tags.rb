FactoryGirl.define do
  factory :tag do
    name { Faker::Lorem.word }
    type { Faker::Lorem.word }
  end
end
