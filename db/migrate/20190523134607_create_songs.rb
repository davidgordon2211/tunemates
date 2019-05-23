class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :spotify_link
      t.string :title
      t.string :artist
      t.references :category, foreign_key: true
      t.references :guest, foreign_key: true

      t.timestamps
    end
  end
end
