class PhotosController < ApplicationController
  before_filter :admin_user
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  def index
    @photos = Photo.all
  end

  def show
  end

  def new
    @photo = Photo.new
  end

  def edit
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.album_id = @photo[:album_id]

    respond_to do |format|
      if @photo.save
        format.html { redirect_to :albums, notice: 'Photo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @photo }
      else
        format.html { redirect_to edit_user_path(current_user), notice: "Something went wrong" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to :albums, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to edit_user_path(current_user), notice: "Something went wrong" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to :albums }
      format.json { head :no_content }
    end
  end

  private

    def set_photo
      @photo = Photo.find(params[:id])
    end

    def photo_params
      params.require(:photo).permit(:album_id, :title, :description, :thumbnail)
    end
end
