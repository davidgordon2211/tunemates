class RenameGuestsToInvitedUsers < ActiveRecord::Migration[5.2]
  def change
    rename_table :guests, :invited_users
  end
end
