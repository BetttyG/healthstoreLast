class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @user_orders = @user.orders
  end
end
