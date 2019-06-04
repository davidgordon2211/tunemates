class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    @game = Game.find(params[:id])
    @rounds = Round.where(game_id: @game.id).where(finished: false)
    # @rounds.shuffle
    @catcolours = ["category-guess-red", "category-guess-purple", "category-guess-blue", "category-guess-yellow"]
    @playercolours = ["in-game-player-button-red", "in-game-player-button-blue", "in-game-player-button-yellow", "in-game-player-button-purple", "in-game-player-button-green"]
    if @rounds.empty?
      redirect_to result_game_path(@game)
      game_finished
    else
      # order by position
      @round = @rounds.order(:position).first
      # @round = @rounds.order(:created_at).first
      # @round = @rounds.order(song_id: :desc).first
      # @round = @rounds.order(:songs_spotify_link_DESC).first
      # @round = @rounds.order('songs.spotify_link DESC').first

      @users = @game.invited_users
      @song = Song.where(id: @round.song_id).first
      @category1 = Category.where(id: @game.category1_id).first
      @category2 = Category.where(id: @game.category2_id).first
    end
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
    @colours = ["player-button-red", "player-button-blue", "player-button-yellow", "player-button-purple"]
    @users = User.all
    @user = current_user
    @game = Game.find(params[:id])
    @category1 = Category.where(id: @game.category1_id).first
    @category2 = Category.where(id: @game.category2_id).first
    @colours = [ "card-category-red", "card-category-blue", "card-category-purple", "card-category-yellow" ]
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
    @colours = [ "card-category-red", "card-category-blue", "card-category-purple", "card-category-yellow" ]

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
    @category = Category.where(id: @game.category1_id).first
  end

  def song_selection2
    if params[:search].present?
      @results = RSpotify::Track.search(params[:search])
    else
      @results = []
    end

    @game = Game.find(params[:id])
    @song = Song.new
    @category = Category.where(id: @game.category2_id).first
  end

  def save_categories
    @game = Game.find(params[:id])
    @game.category1_id = params[:category1]
    @game.category2_id = params[:category2]
    @game.save
    redirect_to song_selection1_game_path(@game)
  end

  def round_finished
    @game = Game.find(params[:id])
    @user_guess = UserGuess.new
    @user_guess.guesser = current_user
    # @invited_user = current_user
    @invited_user = InvitedUser.find_by(user_id: current_user, game: @game)
    @round = Round.find(params[:round_id])
    @user_guess.round = @round
    if params[:category1] == "on"
      @category = Category.find(params[:category_1_id])
    else
      @category = Category.find(params[:category_2_id])
    end
    @user_guess.category = @category
    @song = Song.find_by(id: @round.song_id)
    # @song = Song.find(params[:song_id])
    if current_user == @song.user
      @user_guess.submitter = current_user
    else
      @user_guess.submitter = InvitedUser.where(nickname: params[:name]).first.user
    end
    # @round.song = @song_id
    # @user_guess.submitter = @song.user
    if current_user == @song.user
      @invited_user.score += 0
    elsif @user_guess.category == @song.category && @user_guess.submitter.id == @song.user.id
      @invited_user.score += 10
    elsif @user_guess.category == @song.category || @user_guess.submitter.id == @song.user.id
      @invited_user.score += 5
    end
    @user_guess.save!
    # return @invited_user.score
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
    @game = Game.find(params[:id])
    @invited_users = InvitedUser.where(game: @game)
    # @winner = InvitedUser.nickname.where(maximum: "score")
  end

  # In case methos for winner doesn't work, try this method =>
  # variable = maximum(:value)
  # where(:value => variable)
end
