class ItemsController < ApplicationController
  def index
    @itmes = Item.order("created_at DESC")
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:text, :title, :genre_id).merge(user_id: current_user.id)
  end
end
