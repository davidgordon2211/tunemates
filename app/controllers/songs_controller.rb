class SongsController < ApplicationController
  def create
    raise
    @song = Song.new(song_params)
    # assign to guest @guest = Guest.find(params[:guest_id])
    # assign to category @category = Category.find(params[:category_id])
    @song.save
    # redirect to game#show page
  end

  private

  def song_params
    params.permit(:spotify_link, :artist, :title, :photo, :category_id)
  end
end
