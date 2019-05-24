class GamesController < ApplicationController
  def show
    # lobby
  end

  def new
    # where you create a game (click +)
  end

  def create
    # generate a link
  end

  def destroy
  end

  def song_selection
    @game = Game.find(params[:game_id])
    @song = Song.new
    @category = Category.find(params[:category_id])
    # song_selection view
  end
end
