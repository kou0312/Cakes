class Public::OrdersController < ApplicationController
  def new
    
  end

  def confimation
    @cart_items = current_customer.cart_items.all
    @order = Order.new
  end

  def thanks
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to public_orders_thanks_path
  end

  def index
    @order = Order.all
  end

  def show
  end

  def order_params
    params.require(:order).permit(:name, :address, :customer_id, :payment_method,:postage, :postal_code, :total_payment)
  end

end
