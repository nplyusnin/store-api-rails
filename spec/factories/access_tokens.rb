FactoryBot.define do
  factory :access_token do
    user { nil }
    jti { "MyString" }
    expired_at { "2025-07-18 18:22:19" }
  end
end
