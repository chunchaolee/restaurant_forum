class RenameFriendIdToFriendships < ActiveRecord::Migration[5.1]
  def change
    rename_column :friendships, :freind_id, :friend_id
  end
end
