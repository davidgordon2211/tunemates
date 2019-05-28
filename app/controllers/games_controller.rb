class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
  end

  def create
    # generate a link
    @game = Game.new
    authorize @game
    @game.user = current_user
    @game.save
    redirect_to lobby_game_path(@game)
  end

  def lobby
    @users = User.all
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
    @game = Game.find(params[:id])
    authorize @game
    @categories = Category.all.sample(2)

    # @category.sample(2)
  end

  def update
  end

  def song_selection
    @game = Game.find(params[:id])
    authorize @game
    @song = Song.new
    # @category = Category.find(params[:category_id])
    # song_selection view
  end
end
