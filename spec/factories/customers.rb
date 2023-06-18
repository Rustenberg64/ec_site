FactoryBot.define do
  factory :customer do
    sequence(:email) { |n| "customer#{n}@example.com" }
    password { "password" }
  end
end
