require 'rails_helper'

RSpec.describe "Articles", type: :request do
  let(:user) { create(:user) }
  let(:article) { create(:article) }

  describe 'articles path success' do

    it 'should return success on index' do
      sign_in user
      get articles_path
      expect(response).to have_http_status(:success)
    end

    it 'should return success on show' do
      sign_in user
      get article_path(article.id)
      expect(response).to have_http_status(:success)
    end

    it 'should return success on new' do
      sign_in user
      get new_article_path
      expect(response).to have_http_status(:success)
    end

    it 'should return success on update' do
      sign_in user
      get edit_article_path(article.id)
      expect(response).to have_http_status(:success)
    end

    it 'should return success on destroy' do
      sign_in user
      delete article_path(article.id)
      expect(response).to have_http_status(:success)
    end
  end

  describe "should return fail" do
    it 'should return fail' do
      get articles_path
      expect(response).to have_http_status(302)
    end
  end
end
