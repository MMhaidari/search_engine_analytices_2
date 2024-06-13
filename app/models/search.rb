class Search < ApplicationRecord
  belongs_to :user

  validates :query, presence: true, length: { minimum: 5, maximum: 100 }

  scope :latest_search, -> (user) { where(user: user).order(created_at: :desc).limit(1).first }
  scope :trending, -> { select('query, COUNT(*) as search_count').group(:query).having('COUNT(*) > 3') }
end
