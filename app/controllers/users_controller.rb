class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update, :destroy]
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

  def logged_in_user
    unless logged_in?
      flash[:notice] = "Please log in."
      redirect_to sessions_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :group, :password)
  end

end
