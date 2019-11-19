class ArtistsController < ApplicationController
  before_action :set_artist, only: [ :show, :edit, :update, :destroy ]
  
  def index
    @artists = current_user.artists
  end

  def show
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = current_user.artists.new(artist_params)
    if @artist.save
      redirect_to artists_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @artist.update(artist_params)
      redirect_to artists_path
    else
      render :edit
    end
  end
  
  def destroy
    @artist.destroy
    redirect_to artists_path
  end

private
  def artist_params
    params.require(:artist).permit(:artist_name, :seen_live)
  end

  def set_artist
    @artist = current_user.artists.find(params[:id])
  end
end