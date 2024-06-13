require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      article = Article.new(title: "Example Title", body: "Lorem ipsum dolor sit amet.")
      expect(article).to be_valid
    end
    
    it "is not valid without a title" do
      article = Article.new(title: nil, body: "Lorem ipsum dolor sit amet.")
      expect(article).not_to be_valid
    end
    
    it "is not valid without a body" do
      article = Article.new(title: "Example Title", body: nil)
      expect(article).not_to be_valid
    end
    
    it "is not valid with a body less than 10 characters" do
      article = Article.new(title: "Example Title", body: "Short")
      expect(article).not_to be_valid
    end
  end
  
  describe "pg_search_scope search_by_title_and_body" do
    before(:each) do
      @article1 = Article.create(title: "Ruby on Rails", body: "Introduction to Ruby on Rails framework.")
      @article2 = Article.create(title: "ReactJS", body: "Getting started with ReactJS frontend library.")
      @article3 = Article.create(title: "PostgreSQL", body: "Basic guide to PostgreSQL database.")
    end
    
    it "returns articles with matching title" do
      results = Article.search_by_title_and_body("Ruby")
      expect(results).to include(@article1)
      expect(results).not_to include(@article2, @article3)
    end
    
    it "returns articles with matching body" do
      results = Article.search_by_title_and_body("frontend")
      expect(results).to include(@article2)
      expect(results).not_to include(@article1, @article3)
    end
    
    it "returns articles with prefix matching title" do
      results = Article.search_by_title_and_body("Pos")
      expect(results).to include(@article3)
      expect(results).not_to include(@article1, @article2)
    end
  end
end
