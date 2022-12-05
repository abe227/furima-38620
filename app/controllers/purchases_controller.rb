class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_furima, only: [:index, :create]
  before_action :prevent_url, only: [:index, :create]

  def index
    @purchase_home_address = PurchaseHomeAddress.new
  end

  def create
    @purchase_home_address = PurchaseHomeAddress.new(purchase_params)
    if @purchase_home_address.valid?
      pay_item
      @purchase_home_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_furima
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_home_address).permit(:post_code, :prefecture_id, :municiparities, :address, :building_name, :phone_number, :purchase, :price).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def prevent_url
    return unless @item.user_id == current_user.id || @item.purchase.present?

    redirect_to root_path
  end
end
