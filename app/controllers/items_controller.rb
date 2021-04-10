class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @itmes = Item.order("created_at DESC")
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

  def update
    if current_user.update(item_params)
      redirect_to root_path
    else
      render :create
    end
  end

  private

  def item_params
    params.require(:item).permit(:id, :image, :product_name, :explanatory_text, :product_condition_id, :delivery_fee_id, :shipment_id, :days_to_ship_id, :category_id, :price).merge(user_id: current_user.id)
  end
end
