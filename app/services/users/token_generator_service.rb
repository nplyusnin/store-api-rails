module Users
  class TokenGeneratorService < ApplicationService
    TOKEN_LIFE_TIME = 15.minutes

    private attr_reader :user

    param :user

    def call
      access_token = user.access_tokens.create(
        jti: SecureRandom.uuid,
        expired_at: Time.now + TOKEN_LIFE_TIME
      )

      payload = {
        token_id: access_token.id,
        jti: access_token.jti
      }

      JwtToken.encode(payload)
    end
  end
end
