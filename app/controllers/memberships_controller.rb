class MembershipsController < ApplicationController
  load_and_authorize_resource
  def index; end

  def show; end

  def destroy
    @membership.delete
    redirect_to static_pages_user_page_path
  end
end
