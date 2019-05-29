class Game < ApplicationRecord
  belongs_to :user, :foreign_key => 'host_id', class_name: "User"
  has_many :categories, :foreign_key => 'category1_id', class_name: "Category"
  has_many :categories, :foreign_key => 'category2_id', class_name: "Category"
  has_many :rounds
  has_many :invited_users
end
