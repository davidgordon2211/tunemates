class Addcolumntoinvitedusers < ActiveRecord::Migration[5.2]
  def change
    add_reference :invited_users, :user, index: true, foreign_key: { to_table: :users }
  end
end
