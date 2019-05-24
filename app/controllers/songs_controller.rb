class SongsController < ApplicationController
  def create
    @song = Song.new(song_params)
    @song.invited_user_id = current_user
    @game = Game.find(params[:game_id])
    # @song.game = @game
    # create round with song and game
    # raise
    # @category = Category.find(params[:category_id])
    # @song.category = @category
    @song.save
    authorize @song
    redirect_to game_path(@game)
  end

  private

  def song_params
    params.require(:song).permit(:spotify_link, :artist, :title)
  end
end
