class SongsController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @song = Song.new(song_params)
    @song.user = current_user
    if @song.save!
      @round = Round.new
      @round.game = @game
      @round.save!
      @round.song_id = @song.id
      if @round.save
        set_round_order
        if @song.category_id == @game.category2_id
          redirect_to lobby_game_path(@game)
        else
          redirect_to song_selection2_game_path(@game)
        end
      else
        redirect_to song_selection1_game_path(@game)
      end
    else
      redirect_to song_selection1_game_path(@game)
    end
  end

  private

  def array_up_to(i)
    # this returns an array with range
    (1..i).to_a
  end

  def set_round_order
    round_count = @game.rounds.count
    # making an array from 0 to @game.rounds.count
    position_array = array_up_to(round_count)
    shuffled_position_array = position_array.shuffle
    # iterating over shuffled array and assign the num to a round
    shuffled_position_array.each do |num|
      # each round gets random number
      @round.position = num
      # return @round
    end
  end

  def song_params
    params.permit(:spotify_link, :artist, :title, :photo, :category_id)
  end
end
