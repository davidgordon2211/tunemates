class Category < ApplicationRecord
  has_many :songs
  has_many :user_guesses
end
