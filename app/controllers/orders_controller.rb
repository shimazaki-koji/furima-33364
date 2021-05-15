class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index,]
  before_action :item_find, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  before_action :move_to_order, only: [:index, :create]


  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid? 
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end
  
  private

  def order_params
    params.require(:order_address).permit(:postal_code, :shipment_id, :city, :address, :building, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    unless current_user.id == @item.user
      redirect_to root_path
    end
  end

  def move_to_order
    if @item.order.present?
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end
end
