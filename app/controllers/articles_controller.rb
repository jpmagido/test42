class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new
    @article.create!(params_article)
  end

  def show
    find_article
  end

  def update
    find_article.update!(params_article)
  end

  def destroy
    find_article.delete
  end

  private

  def params_article
    params.require(:article).permit(:title, :content)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
