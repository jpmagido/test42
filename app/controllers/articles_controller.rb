class ArticlesController < ApplicationController
  load_and_authorize_resource param_method: :params_article
  # before_action :authenticate_user!

  def index; end

  def new; end

  def create
    @article = Article.create!(params_article)
    redirect_to article_path(@article.id)
  end

  def show; end

  def edit; end

  def update
    @article.update!(params_article)
    redirect_to article_path(@article.id)
  end

  def destroy
    @article.delete
    redirect_to articles_path
  end

  def create_membership
    Membership.new
  end

  private

  def params_article
    params.require(:article).permit(:title, :content, :user_id)
  end
end
