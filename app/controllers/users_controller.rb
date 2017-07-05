class UsersController < ApplicationController
  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to bags_path
      flash[:notice] = 'You have created a new account!'
    else
      render 'new'
    end
  end


  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'deleted successfully'
    redirect_to '/users'
  end

  private

  def user_params
    params.require(:user).permit(:name, :group, :password)
  end

end
