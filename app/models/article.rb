class Article < ApplicationRecord
  include AlgoliaSearch

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  algoliasearch do
    attribute :title, :body
  end
end