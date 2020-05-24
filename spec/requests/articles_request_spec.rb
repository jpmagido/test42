require 'rails_helper'

RSpec.describe "Articles", type: :request do
  let(:user) { create(:user) }
  let(:admin) { create(:admin) }
  let!(:article) { create(:article) }

  describe 'Admin signed_in' do
    before { sign_in admin }

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

  describe 'User signed_in' do
    let!(:article) { create(:article, user_id: user.id) }
    before { sign_in user }

    it 'should return success on index' do
      get articles_path
      expect(response).to have_http_status(:success)
    end

    it 'should return success on create' do
      get new_article_path
      expect(response).to have_http_status(:success)
    end

    it 'should return success on update if author' do
      get edit_article_path(article.id)
      expect(response).to have_http_status(:success)
    end

    xit 'should return fail on update if author' do
      expect { delete article_path(article.id) }.to raise_error(CanCan::AccessDenied)
    end
  end

  describe "Visitor" do
    let(:article_attr) { create(:article).attributes.slice('title', 'content', 'user_id') }

    it 'should return success on index' do
      get articles_path
      expect(response).to have_http_status(:success)
    end

    it 'should return fail on index' do
      expect { post articles_path, params: {article: article_attr} }
        .to raise_error(CanCan::AccessDenied)
    end
  end
end
