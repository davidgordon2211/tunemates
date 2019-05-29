class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    @songs = Song.all
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

  def song_selection
    #category is not currently being passed when the song saves
    @cat1 = params[:category1]
    # @cat2 = params[:category2]
    if params[:search].present?
      @results = RSpotify::Track.search(params[:search])
    else
      @results = []
    end

    @game = Game.find(params[:id])
    authorize @game

    @song = Song.new
    # @category = Category.find(params[:category_id])
    # song_selection view
  end
end
