class BagsController < ApplicationController
  def index
    @bags = Bag.all
  end

  def new
    @bag = Bag.new
  end

  def create
    @bag = Bag.create(bag_params)
    if @bag.save
      redirect_to bag_path
    else
      render 'new'
    end
  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def bag_params
    params.require(:bag).permit(:name, :number)
  end
end
