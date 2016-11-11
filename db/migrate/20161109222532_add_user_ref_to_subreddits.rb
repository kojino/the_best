class AddUserRefToSubreddits < ActiveRecord::Migration[5.0]
  def change
    add_reference :subreddits, :user, foreign_key: true
  end
end
