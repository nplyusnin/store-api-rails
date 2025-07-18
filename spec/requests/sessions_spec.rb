require "rails_helper"

RSpec.describe "Sessions", type: :request do
  describe "login" do
    let(:credentials) do
      {
        email: "me@example.org",
        password: "password"
      }
    end

    context "when credentials are valid" do
      subject { post "/login", params: credentials }

      let!(:user) { create(:user, **credentials) }

      it "creates access token" do
        expect do
          subject
        end.to change(user.access_tokens, :count).by(1)
      end
      
      it "returns token" do
        subject

        expect(response.body).to match(/\"access_token\":\"(.*)\"/)
      end

      it "returns status success" do
        subject

        expect(response).to have_http_status(:ok)
      end
    end

    context "when credentials are invalid" do
      subject { post "/login", params: credentials }

      it "not creates access token" do
        expect do
          subject
        end.not_to change(AccessToken, :count)
      end

      it "returns error message" do
        subject

        expect(response.body).to include("invalid email or password")
      end

      it "returns status error" do
        subject

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe "logout" do
    subject do
      delete "/logout", headers: { Authorization: "Bearer #{token}" }
    end

    let!(:user) { create(:user) }
    let!(:token) { Users::TokenGeneratorService.new(user).call }
    let!(:access_token) { AccessToken.last }

    it "return status ok" do
      subject

      expect(response).to have_http_status(200)
    end

    it "update token jti" do
      expect do
        subject
      end.to change { access_token.reload.jti }
    end
  end
end