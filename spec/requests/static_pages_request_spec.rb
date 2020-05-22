require 'rails_helper'

RSpec.describe "StaticPages", type: :request do

  describe "GET /home" do
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /user_page" do
    let(:user) { create(:user) }
    it "returns http success" do
      sign_in user
      get "/static_pages/user_page"
      expect(response).to have_http_status(:success)
      end

    it "returns http fail" do
      get "/static_pages/user_page"
      expect(response).to have_http_status(302)
    end
  end

end
