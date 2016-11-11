class User < ApplicationRecord
  has_many :subreddits
  has_many :posts
  has_many :comments
  validates :username, presence: true, length: { maximum: 50, minimum: 3 }
end
