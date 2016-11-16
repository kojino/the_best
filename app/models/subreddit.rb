class Subreddit < ApplicationRecord
  has_many :posts
  validates :title, presence: true, length: { maximum: 30 }
end
