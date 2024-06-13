class SearchController < ApplicationController
  require 'amatch'

  def index
    @results = search_for_articles
    search_create if query_param.present?
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update('articles', partial: 'articles/articles', locals: { articles: @results })
      end
      format.html
    end
  end

  def suggestions
    @results = search_for_articles
    search_create if query_param.present?
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update('suggestions', partial: 'search/suggestions', locals: { results: @results })
      end
      format.html { render partial: 'search/suggestions', locals: { results: @results } }
    end
  end

  private

  def search_create
    latest_search_record = latest_search
    if latest_search_record.nil? || !matched_articles(latest_search_record.query, query_param)
      Search.create(query: query_param.strip, user: current_user)
    else
      latest_search_record.update(query: query_param)
    end
  end

  def latest_search
    Search.where(user: current_user).order(created_at: :desc).first
  end

  def query_param
    params[:query]&.strip
  end

  def matched_articles(str1, str2)
    winkler = Amatch::JaroWinkler.new(str1)
    similarity_distance = winkler.match(str2)
    similarity_distance > 0.7
  end
  
  def search_for_articles
    if params[:query].blank?
      Article.all
    else
      Article.search_by_title_and_body(params[:query])
    end
  end
end
