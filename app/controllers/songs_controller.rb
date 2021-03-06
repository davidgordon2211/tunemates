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
        @round.position = (1..1000).to_a.sample
        @round.save
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

  def song_params
    params.permit(:spotify_link, :artist, :title, :photo, :category_id)
  end
end
