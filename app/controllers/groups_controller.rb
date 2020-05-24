class GroupsController < ApplicationController
  load_and_authorize_resource param_method: :params_group

  def index; end

  def new; end

  def create
    @group = Group.create!(params_group)
    redirect_to group_path(@group.id)
  end

  def show; end

  def edit; end

  def update
    @group.update!(params_group)
    redirect_to group_path(@group.id)
  end

  def destroy
    @group.delete
    redirect_to groups_path
  end

  def create_membership
    Membership.create!(user_id: params[:user_id], group_id: params[:group_id])
    redirect_to group_path(find_group.id)
  end

  private

  def params_group
    params.require(:group).permit(:title, :description, :user_id, :group_id)
  end
end
