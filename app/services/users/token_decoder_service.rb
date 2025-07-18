module Users
  class TokenDecoderService
    private attr_reader :token

    def initialize(token)
      @token = token
    end

    def call
      decoded_token = JwtToken.decode(token)

      decoded_token.first.symbolize_keys
    end
  end
end