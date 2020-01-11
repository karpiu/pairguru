FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user-#{n}@example.com" }
    password { "12345678" }
    confirmed_at Time.now
  end
end
