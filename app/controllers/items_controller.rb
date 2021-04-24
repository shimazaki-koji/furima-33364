class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only: [:edit, :show]
  before_action :move_to_index, only: [:edit]

  def index
    @items = Item.all.order(id: 'DESC')
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
    item = Item.find(params[:id])
    item.update(item_params)
   if item.update(item_params)
    redirect_to item_path
   else
    @item = Item.find(params[:id])
    render :edit
   end
  end

  private

  def item_params
    params.require(:item).permit(:id, :image, :product_name, :explanatory_text, :product_condition_id, :delivery_fee_id, :shipment_id, :days_to_ship_id, :category_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    if user_signed_in?
      unless current_user.id == @item.user.id
        redirect_to action: :index
      end
    else
      redirect_to new_user_session_path
    end
  end
end
