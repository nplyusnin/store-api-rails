require "rails_helper"

describe "Admin/Products", type: :request do
  let(:user) { create(:user) }
  let(:token) { Users::TokenGeneratorService.call(user) }
  describe "index" do
    context "when user authenticated" do
      it "returns products list" do
        get "/admin/products", headers: { Authorization: "Bearer #{token}" }

        expect(response).to have_http_status(:ok)
      end
    end

    context "when user not authenticated" do
      it "returns status 401" do
        get "/admin/products"

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end