class BuysController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @buy_delivery = BuyDelivery.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_delivery = BuyDelivery.new(buy_params)
    if @buy_delivery.valid?
      pay_item
      @buy_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_delivery).permit(:postcode, :prefecture_id, :municipality, :address, :phonenumber, :building_name).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: @item.price,  
        card: buy_params[:token],    
        currency: 'jpy'                 
      )
  end

end
