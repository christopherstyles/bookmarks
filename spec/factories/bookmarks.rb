FactoryGirl.define do
  factory :bookmark do
    url { Faker::Internet.url }
  end
end
