require 'rails_helper'

RSpec.describe "Articles", type: :request do
  let(:user) { create(:user) }
  let!(:article) { create(:article) }

  describe 'User signed_in' do
    before { sign_in user }

    it 'should return success on index' do
      get articles_path
      expect(response).to have_http_status(:success)
    end

    it 'should return success on show' do
      get article_path(article.id)
      expect(response).to have_http_status(:success)
    end

    it 'should return success on new' do
      get new_article_path
      expect(response).to have_http_status(:success)
    end

    it 'should return success on update' do
      get edit_article_path(article.id)
      expect(response).to have_http_status(:success)
    end

    it 'should return success on destroy' do
      expect { article.destroy }.to change { Article.count }.by(-1)
    end
  end

  describe "User signed_out" do
    it 'should return fail on index' do
      get articles_path
      expect(response).to have_http_status(302)
    end
  end
end
