class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    @game = Game.find(params[:id])
    @rounds = Round.where(game_id: @game.id).where(finished: false)
    if @rounds.empty?
      redirect_to result_game_path(@game)
    else
      @round = @rounds.order(:created_at).first
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
    @category = Category.where(id: @game.category1_id).first
    # @category = Category.find(params[:category_id])
    # song_selection view
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
    @invited_user = InvitedUser.where(user_id: current_user).first
    @round = Round.find(params[:round_id])
    @user_guess.round = @round
    if params[category1: "on"]
      @category = Category.find(params[:category_1_id])
      else
      @category = Category.find(params[:category_2_id])
    end
    @user_guess.category = @category
    # @song = Song.find(params[:song_id])
    @song = Song.where(id: @round.song_id).first
    # @round.song = @song_id
    @user_guess.submitter = @song.user
    if @category.id == @song.category
      @invited_user.score += 1
    end
    if @user_guess.submitter == @song.user
      @invited_user.score += 1
    end
    @user_guess.save!
    @invited_user.save!
    # return @invited_user.score
    @round.finished = true
    @round.save
    redirect_to game_path(@game)
  end



  def game_finished
    @user_guess = UserGuess.new
    @user_guess.guesser = current_user
    @invited_user = current_user
    @round = Round.find(params[:round_id])
    @category = Category.find(params[:category_id])
    # @song = Song.find(params[:song_id])

    @user_guess.submitter = @song.user
    if @user_guess.category == @round.song.category
      @invited_user.score += 1
    end
    if @user_guess.submitter == @round.song.user
      @invited_user.score += 1
    end
    @user_guess.save!
    return @invited_user.score
  end


  def result
    @invited_users = InvitedUser.all
    # @winner = InvitedUser.nickname.where(maximum: "score")
  end

  # In case methos for winner doesn't work, try this method =>
  # variable = maximum(:value)
  # where(:value => variable)
end
