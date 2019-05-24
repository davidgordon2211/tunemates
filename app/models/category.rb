class Category < ApplicationRecord
  has_many :songs
  belongs_to :user_guesses
end
