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
  end

  def show
    find_group
  end

  def edit
    find_group
  end

  def update
    find_group.update!(params_group)
  end

  private

  def params_group
    params.require(:grouo).permit(:title, :description)
  end

  def find_group
    @group = Group.find(params[:id])
  end
end
