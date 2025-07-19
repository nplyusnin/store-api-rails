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
      subject { described_class.call(email: "a@example.org", password: "password") }

      it { is_expected.to be_falsey }
    end

    context "when credentials are not valid" do
      subject { described_class.call(email: "me@example.org", password: "passwor") }
  
      it { is_expected.to be_falsey }
    end

    context "when credentials are valid" do
      subject { described_class.call(**valid_credentials) }

      it { is_expected.to eq(user) }
    end
  end
end
