class ItemsController < ApplicationController
  def index
    @itmes = Item.order("created_at DESC")
  end

  def new
    @items = Item.new
  end

  private

  def item_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end
end
