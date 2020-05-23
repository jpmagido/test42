require 'rails_helper'

RSpec.describe "Memberships", type: :request do
  let(:membership) { create(:membership) }
  let(:user) { create(:user)}

  describe "User logged_in" do
    before { sign_in user }

    it "returns http success on index" do
      get memberships_path
      expect(response).to have_http_status(:success)
    end
    it "returns http success on index" do
      get membership_path(membership.id)
      expect(response).to have_http_status(:success)
    end
  end

  describe "User logged out" do
    it "returns http error" do
      get memberships_path
      expect(response).to have_http_status(302)
    end
  end

end
