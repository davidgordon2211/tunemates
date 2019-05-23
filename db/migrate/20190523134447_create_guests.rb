class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.string :nickname
      t.integer :score
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
