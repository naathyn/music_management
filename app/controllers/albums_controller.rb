class AlbumsController < ApplicationController
  before_filter :admin_user
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  def index
    @title = "Your photo albums"
    @albums = Album.page(params[:page])
  end

  def show
  end

  def new
    @album = Album.new
  end

  def edit
  end

  def create
    @album = Album.new(album_params)

    respond_to do |format|
      if @album.save
        format.html { redirect_to :albums, notice: 'Album was successfully created.' }
        format.json { render action: 'show', status: :created, location: @album }
      else
        format.html { redirect_to edit_user_path(current_user), notice: "Something went wrong" }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to :albums, notice: 'Album was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to :albums }
      format.json { head :no_content }
    end
  end

  private

    def set_album
      @album = Album.find(params[:id])
    end

    def album_params
      params.require(:album).permit(:name)
    end
end
