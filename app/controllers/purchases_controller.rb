class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
  end

  def new
  end

  def create
    @purchase = Purchase.create(purchase_params)
    Home_address.create(address_params)
    redirect_to root_path
    binding.pry
  end

  private

  def purchase_params
    params.permit(:item, :user).merge(user_id: current_user.id)
  end

  def address_params
    params.permit(:post_code, :prefecture_id, :municiparities, :address, :building_name, :phone_number, :purchase).merge(purchase_id: @purchase.id)
  end
end
