class CreateGuestGuesses < ActiveRecord::Migration[5.2]
  def change
    create_table :guest_guesses do |t|
      t.references :round, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
