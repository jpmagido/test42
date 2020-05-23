require 'rails_helper'

RSpec.describe "Groups", type: :request do
  let(:user) { create(:user) }
  let(:group) { create(:group) }

  describe 'User signed_in' do
    before { sign_in user }

    it "returns success on index" do
      get groups_path
      expect(response).to have_http_status(:success)
    end

    it "returns http success on edit" do
      get edit_group_path(group.id)
      expect(response).to have_http_status(:success)
    end

    it "returns http success on show" do
      get group_path(group.id)
      expect(response).to have_http_status(:success)
    end

    it "returns http success on new" do
      get new_group_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "User signed out" do
    it "returns http success" do
      get groups_path
      expect(response).to have_http_status(302)
    end
  end
end
