class OrdersController < ApplicationController
  def index
    @order_address = OrderAddress.new
  end

  #def new
    #@order_address = OrderAddress.new
  #end

  def create
    @order_address = OrderAddress.new(order_params)
    # binding.pry
    if @order_address.valid? 
      @order_address.save
      redirect_to action: :index
    else
      render action: :index
    end
  end
  
  private

  def order_params
    params.require(:order_address).permit(:postal_code, :shipment_id, :city, :address, :building, :phone_number).merge( user_id: current_user.id, item_id: params[:item_id])
  end
  # token: params[:token],
end
