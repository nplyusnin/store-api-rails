require "rails_helper"

describe Users::TokenGeneratorService do
  let(:user) { create(:user) }
  describe "#call" do
    it "returns valid token" do
      token = described_class.call(user)

      payload = JwtToken.decode(token)
      token_id = payload.first["token_id"]

      last_access_token = user.access_tokens.last
      
      expect(token_id).to eq(last_access_token.id)
    end

    it "creates new access toker for user" do
      expect do
        described_class.call(user)
      end.to change(user.access_tokens, :count).by(1)
    end
  end
end
