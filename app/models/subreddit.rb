class Subreddit < ApplicationRecord
  has_many :posts, :dependent => :destroy
  belongs_to :user
  validates :title, presence: true, length: { maximum: 30 }
end
