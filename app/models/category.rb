class Category < ApplicationRecord
  has_many :songs
  has_many :guest_guesses
end
