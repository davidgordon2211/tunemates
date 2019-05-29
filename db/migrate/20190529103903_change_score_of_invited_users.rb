class ChangeScoreOfInvitedUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :invited_users, :score, :integer, default: 0
  end
end
