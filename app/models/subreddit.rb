class Subreddit < ApplicationRecord
  belongs_to :user
  has_many :posts
  validates :title, presence: true, length: { maximum: 30 }
end
