require "rails_helper"

describe Users::TokenDecoderService do
  describe "#call" do
    let(:user) { create(:user) }
    let!(:token) { Users::TokenGeneratorService.call(user) }

    it "returns correct token id" do
      last_token = AccessToken.last
      decoded_token = described_class.call(token)

      expect(decoded_token).to eq({
        token_id: last_token.id,
        jti: last_token.jti
      })
    end
  end
end
