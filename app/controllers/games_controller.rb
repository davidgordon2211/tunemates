class GamesController < ApplicationController

  def create
    # generate a link
    @game = Game.new
    authorize @game
    @game.user = current_user
    @game.save
    redirect_to lobby_game_path(@game)
  end

  def lobby
    @game = Game.find(params[:id])
    authorize @game
  end

  def destroy
    @game = Game.find(params[:id])
    authorize @game
    @game.destroy
    redirect_to dashboard_path
  end

  def category
    @category = Category.all
    @category.sample(2)
  end

  def song_selection
    @game = Game.find(params[:game_id])
    @song = Song.new
    @category = Category.find(params[:category_id])
    # song_selection view
  end
end
