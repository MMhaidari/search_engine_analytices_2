class Search < ApplicationRecord
  belongs_to :user

  validates :query, presence: true, length: { minimum: 5, maximum: 100 }

  scope :latest_search, -> (user) { where(user: user).order(created_at: :desc).limit(1).first }
end
