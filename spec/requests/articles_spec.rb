require 'rails_helper'

RSpec.describe "Articles", type: :request do
  describe "GET /index" do
    it "renders the index template" do
      get "/articles"
      expect(response).to render_template(:index)
      expect(response).to have_http_status(:ok)
    end

    it "assigns @articles" do
      articles = create_list(:article, 3)
      get "/articles"
      expect(assigns(:articles)).to eq(articles)
    end
  end

  describe "GET /show" do
    let(:article) { create(:article) }

    it "renders the show template" do
      get "/articles/#{article.id}"
      expect(response).to render_template(:show)
      expect(response).to have_http_status(:ok)
    end

    it "assigns @article" do
      get "/articles/#{article.id}"
      expect(assigns(:article)).to eq(article)
    end
  end

  describe "GET /new" do
    it "renders the new template" do
      get "/articles/new"
      expect(response).to render_template(:new)
      expect(response).to have_http_status(:ok)
    end

    it "assigns a new article as @article" do
      get "/articles/new"
      expect(assigns(:article)).to be_a_new(Article)
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new article" do
        expect {
          post "/articles", params: { article: attributes_for(:article) }
        }.to change(Article, :count).by(1)
      end

      it "redirects to the created article" do
        post "/articles", params: { article: attributes_for(:article) }
        expect(response).to redirect_to(Article.last)
      end
    end

    context "with invalid parameters" do
      it "does not create a new article" do
        expect {
          post "/articles", params: { article: { title: '' } }
        }.to_not change(Article, :count)
      end
    end
  end

  describe "PATCH /update" do
    let(:article) { create(:article) }

    context "with valid parameters" do
      it "updates the article" do
        patch "/articles/#{article.id}", params: { article: { title: "Updated Title" } }
        article.reload
        expect(article.title).to eq("Updated Title")
      end

      it "redirects to the updated article" do
        patch "/articles/#{article.id}", params: { article: { title: "Updated Title" } }
        expect(response).to redirect_to(article)
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:article) { create(:article) }

    it "destroys the article" do
      expect {
        delete "/articles/#{article.id}"
      }.to change(Article, :count).by(-1)
    end
  end
end
