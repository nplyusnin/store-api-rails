module Users
  class RevokeTokenService < ApplicationService
    private attr_reader :token

    param :token

    def call
      return if token.blank?

      payload = JwtToken.decode(token)
      token_id = payload.first["token_id"]

      access_token = AccessToken.find_by(id: token_id)

      return if access_token.blank?

      access_token.update(jti: SecureRandom.uuid)

      return nil
    end
  end
end
