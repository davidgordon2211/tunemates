class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @invited_users = InvitedUser.order(created_at: :desc)
    @cards = ["game-image-red", "game-image-blue", "game-image-purple", "game-image-yellow"]
  end
end
