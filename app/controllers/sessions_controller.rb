class SessionsController < ApplicationController
  def index

  end

  def new

  end

  def create
    user = User.where(:name => params[:session][:name].downcase).first
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash.now[:notice] = "Logged in"
      redirect_to bags_path
    else
      flash.now[:notice] = "Invalid username/password combination."
      render 'new'
    end
  end
  def destroy
    if !session[:user_id] = nil
      session[:user_id] = nil
      flash[:notice] = "User logged out"
      redirect_to users_path
    else
      flash[:notice] = "Not signed in"
      render 'new'
    end
  end
end
