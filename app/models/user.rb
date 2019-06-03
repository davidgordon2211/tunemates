class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :games, :foreign_key => 'host_id', class_name: "Game"
  has_many :songs
  has_many :invited_users
  has_many :user_guesses, :foreign_key => 'guesser_id', class_name: "User"
  has_many :user_guesses, :foreign_key => 'submitter_id', class_name: "User"
  mount_uploader :photo, PhotoUploader
end
