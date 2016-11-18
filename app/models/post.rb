class Post < ApplicationRecord
  has_many :comments, :dependent => :destroy
  belongs_to :subreddit
  belongs_to :user
  validates :title, presence: true, length: { maximum: 140 }
end
