class Addreferenceinvitedusertosongs < ActiveRecord::Migration[5.2]
  def change
    add_reference :songs, :invited_user, index: true, foreign_key: { to_table: :songs }
  end
end
