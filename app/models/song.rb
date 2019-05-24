class Song < ApplicationRecord
  belongs_to :category
  belongs_to :invited_user
  belongs_to :round
end
