class InvitedUser < ApplicationRecord
  belongs_to :game
  belongs_to :user
  has_many :songs
  has_many :user_guesses, :foreign_key => 'guesser_id', class_name: "UserGuess"
  has_many :user_guesses, :foreign_key => 'submitter_id', class_name: "UserGuess"
end
