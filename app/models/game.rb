class Game < ApplicationRecord
  belongs_to :user
  has_many :rounds
  has_many :guests
end
