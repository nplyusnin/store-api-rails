require "rails_helper"

describe Users::RevokeTokenService do
  subject { described_class.call(token) }

  let(:user) { create(:user) }
  let!(:token) { Users::TokenGeneratorService.call(user) }
  let!(:access_token) { AccessToken.last }

  describe "#call" do
    it "updates jti" do
      expect { subject }.to change { access_token.reload.jti }
    end
  end
end