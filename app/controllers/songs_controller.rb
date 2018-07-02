class SongsController < ApplicationController

  def index
    @songs = Song.all

  end

  def show
    fetch_song

  end

  def new
    @song = Song.new

  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to @song
    else
      render :new
    end

  end

  def edit
    fetch_song

  end

  def update
    fetch_song

    if @song.update(song_params)
      redirect_to @song
    else
      render :edit
    end


  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to @song

  end

  private

  def fetch_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(
      :title, :release_year, :released, :genre, :artist_name
    )
  end


end
