class User < ApplicationRecord
  has_many :subreddits, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :username, presence: true, length: { maximum: 50, minimum: 3 }
  has_secure_password
end
