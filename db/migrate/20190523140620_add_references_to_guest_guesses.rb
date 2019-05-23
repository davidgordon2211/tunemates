class AddReferencesToGuestGuesses < ActiveRecord::Migration[5.2]
  def change
    add_reference :guest_guesses, :guesser, index: true, foreign_key: { to_table: :guests }
    add_reference :guest_guesses, :submitter, index: true, foreign_key: { to_table: :guests }
  end
end
