class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(params_group)
    @group.save!
    redirect_to groups_path
  end

  def show
    find_group
  end

  def edit
    find_group
  end

  def update
    find_group.update!(params_group)
    redirect_to groups_path
  end

  def destroy
    find_group.delete
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

  def find_group
    @group = Group.find(params[:id])
  end
end
