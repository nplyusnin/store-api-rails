module Users
  class AuthenticateByTokenService
    private attr_reader :token

    def initialize(token)
      @token = token
    end

    def call
      return if token.blank?

      decoded_token = Users::TokenDecoderService.new(token).call

      access_token = AccessToken.find_by(id: decoded_token[:token_id])

      if access_token.jti == decoded_token[:jti] && access_token.expired_at > Time.now
        access_token.user
      else
        nil
      end
    end
  end
end