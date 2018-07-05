class SongsController < ApplicationController
  before_action :find_song, only: [:show, :edit, :update]

  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end


  def destroy
    Song.destroy(params[:id])
    redirect_to songs_path
  end


  private

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :genre, :artist_name)
  end

  def find_song
    @song = Song.find(params[:id])
  end

end
