class AlbumsController < ApplicationController

  def index
    @albums = PicasaApi::GetAlbums.call current_user
    respond_to do |format|
      format.html
      format.json { render json: @albums }
    end
  end

  def show
    @photos = PicasaApi::GetPhotos.call current_user, params[:id]
    respond_to do |format|
      format.html
      format.json { render json: @photos }
    end
  end

end