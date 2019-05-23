class Guest < ApplicationRecord
  belongs_to :game
  has_many :songs
  has_many :guest_guesses, :foreign_key => 'guesser_id', class_name: "guest_guess"
  has_many :guest_guesses, :foreign_key => 'submitter_id', class_name: "guest_guess"
end
