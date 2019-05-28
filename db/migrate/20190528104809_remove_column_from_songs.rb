class RemoveColumnFromSongs < ActiveRecord::Migration[5.2]
  def change
    remove_column :songs, :invited_user_id
  end
end
