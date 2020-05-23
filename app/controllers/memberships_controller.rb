class MembershipsController < ApplicationController
  def index
    Membership.all
  end

  def show
    find_membership
  end

  def destroy
    find_membership.delete
  end

  private

  def find_membership
    @membership= Membership.find(params[:id])
  end
end
