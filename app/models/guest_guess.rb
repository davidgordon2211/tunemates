class GuestGuess < ApplicationRecord
  belongs_to :round
  belongs_to :category
  belongs_to :guesser, :foreign_key => 'guesser_id', class_name: "Guest"
  belongs_to :submitter, :foreign_key => 'submitter_id', class_name: "Guest"
end
