FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.word }
    user { create(:user) }
  end
end
