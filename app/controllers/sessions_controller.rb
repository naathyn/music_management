class SessionsController < ApplicationController

  def new
    if signed_in?
      redirect_to :home, notice: "You are already signed in!"
    else
      @title = "Sign in"
    end
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:success] = "Welcome back!"
      redirect_back_or :home
    else
      flash.now[:error] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to :home, notice: "See ya'!"
  end
end
