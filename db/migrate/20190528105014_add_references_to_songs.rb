class AddReferencesToSongs < ActiveRecord::Migration[5.2]
  def change
    add_reference :songs, :user, index: true, foreign_key: { to_table: :users }
  end
end
