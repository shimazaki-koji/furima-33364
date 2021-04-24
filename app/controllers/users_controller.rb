class UsersController < ApplicationController

  def update
    @user = User.find(params[:id])
    @item = @user.items
  end
end