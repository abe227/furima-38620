class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :explanation, :price, :image, :category_id, :situation_id, :cost_id, :days_to_ship_id, :prefecture_id).merge(user_id: current_user.id)
  end

  def home_addresses_params
    params.permit(:post_code, :prefecture, :city, :house_number, :building_name).merge(donation_id: @donation.id)
  end
  
end
