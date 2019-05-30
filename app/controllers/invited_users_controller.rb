class InvitedUsersController < ApplicationController
  def new
  end

  def create
    @game = Game.find(params[:game_id])
    params["user"].each do |user|
      @user = User.find(user)
      @invited_user = InvitedUser.new
      @invited_user.user_id = @user.id
      @invited_user.game = @game
      @invited_user.nickname = @user.first_name
      @invited_user.save
    end
    @invited_user1 = InvitedUser.new
    @invited_user1.user = current_user
    @invited_user1.nickname = current_user.first_name
    @invited_user1.game = @game
    @invited_user1.save
    if @game.save
      redirect_to lobby_game_path(@game)
    else
      raise
    end
  end
end
