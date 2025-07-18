require "rails_helper"

describe Users::AuthenticateByTokenService do
  describe "#call" do
    context "when token present" do
      subject { described_class.call(token) }

      let(:user) { create(:user) }
      let(:token) { Users::TokenGeneratorService.call(user) }

      it { is_expected.to eq(user) }
    end

    context "when token expired" do
      subject { described_class.call(token) }

      let(:user) { create(:user) }
      let!(:token) { Users::TokenGeneratorService.call(user) }

      before do
        AccessToken.last.update(expired_at: Time.now - 1.day)
      end

      it { is_expected.to eq(nil) }
    end

    context "when token revoked" do
      subject { described_class.call(token) }

      let(:user) { create(:user) }
      let!(:token) { Users::TokenGeneratorService.call(user) }

      before do
        AccessToken.last.update(jti: SecureRandom.uuid)
      end

      it { is_expected.to eq(nil) }
    end

    context "when token blank" do
      subject { described_class.call(nil) }

      it { is_expected.to be_nil }
    end
  end
end
