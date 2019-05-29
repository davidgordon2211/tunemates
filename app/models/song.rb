class Song < ApplicationRecord
  belongs_to :category
  belongs_to :user
  # belongs_to :round
end
