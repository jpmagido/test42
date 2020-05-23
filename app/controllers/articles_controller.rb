class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params_article)
    @article.save!
    redirect_to articles_path
  end

  def show
    find_article
  end

  def edit
    find_article
  end

  def update
    find_article.update!(params_article)
    redirect_to articles_path
  end

  def destroy
    find_article.delete
    redirect_to articles_path
  end

  def create_membership
    Membership.new
  end

  private

  def params_article
    params.require(:article).permit(:title, :content, :user_id)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
