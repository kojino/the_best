class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  belongs_to :subreddit
  validates :title, presence: true, length: { maximum: 140 }
end
