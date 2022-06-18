class Public::OrderCartsController < ApplicationController
  def create
  @order_cart = OrderCart.new(order_cart_params)
  @order_cart.save
  redirect_to 
  end
  
  private
  def order_cart_params
    params.require(:order_cart).permit(:customer_id, :item_id, :order_id, :amount)
  end  
end
