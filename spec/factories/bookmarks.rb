# frozen_string_literal: true

FactoryBot.define do
  factory :bookmark do
    url { Faker::Internet.url }

    trait :invalid do
      url { nil }
    end
  end
end
