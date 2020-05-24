require 'rails_helper'

RSpec.describe "Memberships", type: :request do
  let(:membership) { create(:membership) }
  let(:user) { create(:user) }
  let(:admin) { create(:admin) }

  describe "User logged_in" do
    before { sign_in admin }

    it "returns http success on index" do
      get memberships_path
      expect(response).to have_http_status(:success)
    end
    it "returns http success on index" do
      get membership_path(membership.id)
      expect(response).to have_http_status(:success)
    end
  end
=begin
  describe "User logged out" do
    let(:membership_attr) { create(:membership).attributes.slice('group_id', 'user_id') }
    it "returns http error" do
      expect { post memberships_path, params: {membership: membership_attr} }
        .to raise_error(CanCan::AccessDenied)
    end
  end
=end
end
