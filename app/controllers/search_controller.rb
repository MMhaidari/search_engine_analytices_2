class SearchController < ApplicationController
  def index
    @results = search_for_articles
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update('articles', partial: 'articles/articles', locals: { articles: @results })
      end
    end
  end

  def suggestions
    @results = search_for_articles
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update('suggestion', partial: 'search/suggestions', locals: { results: @results })
      end
    end
  end

  private

  def query_param
    params[:query]&.strip
  end

  def search_for_articles
    if params[:query].blank?
      Article.all
    else
      Article.search(query_param)
    end
  end
end
