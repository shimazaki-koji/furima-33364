class OrdersController < ApplicationController

  def index
    @order = Order.new
  end

  def create
    @order =Order.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render "index"
    end
  end
  
  private

  def order_params
    params.reqire(:order).permit(:postal_code, :shipment_id, :municipalities, :addres, :building, :phone_nunber).merge(user_id: current_user.id)
  end
  
end
