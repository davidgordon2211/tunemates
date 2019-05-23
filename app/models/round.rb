class Round < ApplicationRecord
  belongs_to :game
  has_one :song
  has_many :guest_guesses
end
