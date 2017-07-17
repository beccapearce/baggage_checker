class SessionsController < ApplicationController
  def new

  end
  def create
    @group = User.where(:group => params[:group])
    @user = @group.where(:name => params[:name])
    if @user.authenticate(params[:password])
      redirect_to bag_path
    else
      flash.now[:notice] = "Invalid username/password combination."
    end
  end
end
