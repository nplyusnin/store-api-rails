require "rails_helper"

describe Users::AuthenticateService do
  let(:valid_credentials) {
    {
      email: "me@example.org",
      password: "password"
    }
  }

  let!(:user) { create(:user, valid_credentials) }

  describe "#call" do
    context "when user not found" do
      subject { described_class.new(email: "a@example.org", password: "password").call }

      it { is_expected.to be_falsey }
    end

    context "when credentials are not valid" do
      subject { described_class.new(email: "me@example.org", password: "passwor").call }
  
      it { is_expected.to be_falsey }
    end

    context "when credentials are valid" do
      subject { described_class.new(**valid_credentials).call }

      it { is_expected.to eq(user) }
    end
  end
end