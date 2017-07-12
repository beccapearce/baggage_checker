class BagsController < ApplicationController

  # before_action :authenticate_user!

  def index
    @bags = Bag.all
  end

  def new
    @bag = Bag.new
  end

  def create
    @bag = Bag.create(bag_params)
    if @bag.save
      redirect_to bags_path
    else
      render 'new'
    end
  end

  def show
    @bag = Bag.find(params[:id])
  end

  def edit
    @bag = Bag.find(params[:id])
  end

  def update
    @bag = Bag.find(params[:id])
    @bag.update(bag_params)
    redirect_to '/bags'
  end

  def destroy
    @bag = Bag.find(params[:id])
    @bag.destroy
    flash[:notice] = 'Bag deleted successfully'
    redirect_to '/bags'
  end

  private

  def bag_params
    params.require(:bag).permit(:name, :number, :description)
  end
end
