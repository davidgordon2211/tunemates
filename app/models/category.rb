class Category < ApplicationRecord
  has_many :songs
  belongs_to :guest_guesses
end
