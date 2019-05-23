class Song < ApplicationRecord
  belongs_to :category
  belongs_to :guest
  belongs_to :round
end
