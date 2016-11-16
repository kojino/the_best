class RemoveUserRefFromSubreddits < ActiveRecord::Migration[5.0]
  def change
    remove_reference :subreddits, :user, foreign_key: true
  end
end
