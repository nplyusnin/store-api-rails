module Users
  class TokenDecoderService < ApplicationService
    private attr_reader :token

    param :token

    def call
      decoded_token = JwtToken.decode(token)

      decoded_token.first.symbolize_keys
    end
  end
end
