FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "user#{i}@example.org" }
    password { "password" }
  end
end
