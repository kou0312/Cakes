class Public::OrdersController < ApplicationController
  def new
    @customer = Customer.find_by(params[:email])
    @order = Order.new
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
    redirect_to public_orders_confimation_path
  end

  def index
    @order = Order.all
  end

  def show
  end


private
  def order_params
    params.permit(:name, :address, :address_option, :payment_method)
  end

end
