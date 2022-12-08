class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  before_action :prevent_url, only: [:edit]

  def index
    @items = Item.all.order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    return unless @item.destroy

    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :explanation, :price, :image, :category_id, :situation_id, :cost_id, :days_to_ship_id, :prefecture_id).merge(user_id: current_user.id)
  end

  def home_addresses_params
    params.permit(:post_code, :prefecture, :city, :house_number, :building_name).merge(item_id: @item.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end

  def prevent_url
    return unless @item.purchase.present?

    redirect_to root_path
  end
end
