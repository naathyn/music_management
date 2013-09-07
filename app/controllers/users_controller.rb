class UsersController < ApplicationController
  before_filter :admin_user
  before_action :set_user, only: [:edit, :update, :destroy]

  def show
    @title = "Unorganized things..."
    @albums = Album.page(params[:page])
  end

  def edit
    @album = Album.new
    @photo = Photo.new
    @title = "Your Account"
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def bio
    respond_to :html, :js
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
