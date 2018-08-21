class RenameLeaderIdToUserId < ActiveRecord::Migration[5.2]
  def change
    rename_column :teams, :leader_id, :user_id
  end
end
