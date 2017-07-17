class SessionsController < ApplicationController
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
end
