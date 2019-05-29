class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    @rounds = Round.where(game_id: @game.id).where(finished: false)
    @round = @rounds.order(:created_at).first
    # if @round.nil? redirect to score page else...
    @users = @game.invited_users
    @song = Song.where(id: @round.song_id).first
    @category1 = Category.where(id: @game.category1_id).first
    @category2 = Category.where(id: @game.category2_id).first

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

  def song_selection1
    if params[:search].present?
      @results = RSpotify::Track.search(params[:search])
    else
      @results = []
    end

    @game = Game.find(params[:id])
    @song = Song.new
    # @category = Category.find(params[:category_id])
    # song_selection view
  end

  def song_selection2
    song_selection1
  end


  def save_categories
    @game = Game.find(params[:id])
    @game.category1_id = params[:category1]
    @game.category2_id = params[:category2]
    @game.save
    redirect_to song_selection1_game_path(@game)
  end
end
