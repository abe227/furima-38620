class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @item = Item.find(params[:item_id])
    @purchase_home_address = PurchaseHomeAddress.new
  end

 

  def create
    @item = Item.find(params[:item_id])
     @purchase_home_address = PurchaseHomeAddress.new(purchase_params)
    if @purchase_home_address.valid?
       @purchase_home_address.save
       redirect_to root_path
    else
       render :index
    end
   
  end

  private

  def purchase_params
    params.require(:purchase_home_address).permit(:post_code, :prefecture_id, :municiparities, :address, :building_name, :phone_number, :purchase).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  
end
