class MembershipsController < ApplicationController
  before_action :authenticate_user!
  def index
    @memberships = Membership.all
  end

  def show
    find_membership
  end

  def destroy
    find_membership.delete
    redirect_to static_pages_user_page_path
  end

  private

  def find_membership
    @membership = Membership.find(params[:id])
  end
end
