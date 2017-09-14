FactoryGirl.define do
  factory :tagging do
    taggable_type { Faker::Lorem.word }
    taggable_id { SecureRandom.uuid }
  end
end
