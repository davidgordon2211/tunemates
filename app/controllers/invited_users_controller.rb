class InvitedUsersController < ApplicationController
  def new
  end

  def create
    @game = Game.find(params[:game_id])
    @user = User.find(params[:game_invited_user][:user_id])
    @invited_user = InvitedUser.new
    @invited_user.user_id = @user.id
    @invited_user.nickname = @user.first_name
    @invited_user.game = @game
    if @invited_user.save
      redirect_to lobby_game_path(@game)
    else raise
    end
  end
end
