class Game < ApplicationRecord
  belongs_to :user, :foreign_key => 'host_id', class_name: "User"
  has_many :rounds
  has_many :invited_users
end
