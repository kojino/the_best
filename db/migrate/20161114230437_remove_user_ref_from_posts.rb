class RemoveUserRefFromPosts < ActiveRecord::Migration[5.0]
  def change
    remove_reference :posts, :user, foreign_key: true
  end
end
