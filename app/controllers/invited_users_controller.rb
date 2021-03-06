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
      @invited_user.score = 0
      @invited_user.save
    end
    @invited_user1 = InvitedUser.new
    @invited_user1.user = current_user
    @invited_user1.nickname = current_user.first_name
    @invited_user1.game = @game
    @invited_user1.score = 0
    @invited_user1.save
    @game.save

    @colours = [ "player-button-Red", "player-button-Blue", "player-button-Yellow", "player-button-Purple"]

    if @invited_user.save || invited_user1.save
      respond_to do |format|
        # format.html { redirect_to dashboard_path }
        format.js # <-- this will render corresponding js file
      end
    # else
    #   respond_to do |format|
    #     # format.html { redirect_to lobby_game_path(@game) }
    #     format.js
    #   end
    end
  end
end
