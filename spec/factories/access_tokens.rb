FactoryBot.define do
  factory :access_token do
    association(:user)
    jti { SecureRandom.uuid }
    expired_at { Time.now }
  end
end
