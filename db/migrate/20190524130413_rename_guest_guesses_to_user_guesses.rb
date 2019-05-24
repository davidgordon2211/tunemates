class RenameGuestGuessesToUserGuesses < ActiveRecord::Migration[5.2]
  def change
    rename_table :guest_guesses, :user_guesses
  end
end
