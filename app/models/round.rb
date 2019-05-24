class Round < ApplicationRecord
  belongs_to :game
  has_one :song
  has_many :user_guesses
end
