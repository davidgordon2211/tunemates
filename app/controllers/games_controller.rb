class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_game, only: [:show, :lobby, :destroy, :category, :song_selection1, :song_selection2, :save_categories, :round_finished, :result]

  def show
    @rounds = Round.where(game_id: @game.id).where(finished: false)
    @catcolours = ["category-guess-red", "category-guess-purple", "category-guess-blue", "category-guess-yellow"]
    @playercolours = ["in-game-player-button-red", "in-game-player-button-blue", "in-game-player-button-yellow", "in-game-player-button-purple", "in-game-player-button-green"]
    # if @rounds.empty?
    if @rounds.length == 2
      redirect_to result_game_path(@game)
      game_finished
    else
      @round = @rounds.order(:position).first

      # previous attempts to show rounds in a random order:
      # @round = @rounds.order(:created_at).first
      # @round = @rounds.order(song_id: :desc).first
      # @round = @rounds.order(:songs_spotify_link_DESC).first
      # @round = @rounds.order('songs.spotify_link DESC').first

      @users = @game.invited_users.where.not(user_id: current_user)
      @song = Song.where(id: @round.song_id).first
      @category1 = Category.where(id: @game.category1_id).first
      @category2 = Category.where(id: @game.category2_id).first
    end
  end

  def create
    @game = Game.new
    authorize @game
    @game.user = current_user
    @game.save
    redirect_to lobby_game_path(@game)
  end

  def lobby
    @colours = ["player-button-red", "player-button-blue", "player-button-yellow", "player-button-purple"]
    @users = User.where.not(id: current_user)
    @user = current_user
    @category1 = Category.where(id: @game.category1_id).first
    @category2 = Category.where(id: @game.category2_id).first
    @colours = ["card-category-red", "card-category-blue", "card-category-purple", "card-category-yellow" ]
    @rounds = Round.where(game_id: @game.id)
  end

  def destroy
    authorize @game
    @game.destroy
    redirect_to dashboard_path
  end

  def category
    @game = Game.find(params[:id])
    authorize @game
    @categories = Category.all.sample(2)
    @colours = [ "card-category-red", "card-category-blue", "card-category-purple", "card-category-yellow" ]
  end

  def song_selection1
    if params[:search].present?
      @results = RSpotify::Track.search(params[:search])
    else
      @results = []
    end
    @song = Song.new
    @category = Category.where(id: @game.category1_id).first

    respond_to do |format|
      format.html { render "games/song_selection1" }
      format.js
    end
  end

  def song_selection2
    if params[:search].present?
      @results = RSpotify::Track.search(params[:search])
    else
      @results = []
    end
    @song = Song.new
    @category = Category.where(id: @game.category2_id).first
    respond_to do |format|
      format.html { render "games/song_selection2" }
      format.js
    end
  end

  def save_categories
    @game.category1_id = params[:category1]
    @game.category2_id = params[:category2]
    @game.save
    redirect_to song_selection1_game_path(@game)
  end

  def round_finished
    @user_guess = UserGuess.new
    @user_guess.guesser = current_user
    @invited_user = InvitedUser.find_by(user_id: current_user, game: @game)
    @round = Round.find(params[:round_id])
    @user_guess.round = @round
    @song = Song.find_by(id: @round.song_id)
    if current_user == @song.user
      @user_guess.submitter = current_user
    elsif !params[:name].nil?
      @user_guess.submitter = InvitedUser.where(nickname: params[:name]).first.user
    end
    if params[:category1] == "on"
      @category = Category.find(params[:category_1_id])
      @user_guess.category = @category
    elsif params[:category2] == "on"
      @category = Category.find(params[:category_2_id])
      @user_guess.category = @category
    else @user_guess.submitter = current_user
    end
    if current_user == @song.user
      @invited_user.score += 0
    elsif @user_guess.submitter == nil
      @invited_user.score += 0
    elsif @user_guess.category == @song.category && @user_guess.submitter.id == @song.user.id
      @invited_user.score += 10
    elsif @user_guess.category == @song.category || @user_guess.submitter.id == @song.user.id
      @invited_user.score += 5
    end
    @round.finished = true
    @round.save
    @invited_user.save!
    redirect_to game_path(@game)
  end

  def game_finished
    @user = current_user
    @game.status = true
    @game.save
  end

  def result
    @invited_users = InvitedUser.where(game: @game)
    @songs = @game.rounds.map { |e| Song.find(e.song_id) }
  end

  private

  def find_game
    @game = Game.find(params[:id])
  end
end
