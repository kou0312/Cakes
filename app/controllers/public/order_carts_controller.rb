class Public::OrderCartsController < ApplicationController
  def create
  binding.pry
  @order_cart = OrderCart.new(order_cart_params)
  @order_cart.save
  redirect_to public_order_new_path
  end

  private
  def order_cart_params
    params.require(:order_cart).permit(:customer_id, :item_id, :order_id, :amount)
  end
end
