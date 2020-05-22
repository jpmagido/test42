class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: [:user_page]

  def home
  end

  def user_page
  end
end
