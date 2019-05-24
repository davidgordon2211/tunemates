class GamesController < ApplicationController
  def show
    # lobby
    # anyone should be able to view/join the game
    skip_pundit?
  end

  def new
    # where you create a game (click +)
    authorise @user
  end

  def create
    # generate a link
    authorise @user
  end

  def destroy
    authorise @user
  end
end
