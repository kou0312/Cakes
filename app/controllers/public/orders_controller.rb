class Public::OrdersController < ApplicationController
  def new
    @cart_items = current_customer.cart_items.all
    @customer = Customer.find_by(params[:email])
    @order = Order.new

  end

  def create
    @order = Order.new(order_params)
    binding.pry
    @order.save

    redirect_to public_orders_confimation_path
  end

  def confimation

    @order = Order.find_by(params[:address_option])
    @cart_items = current_customer.cart_items.all
    @order.payment_method = params[:order][:payment_method]


  end

  def thanks
  end



  def index
    @order = Order.all
  end

  def show
  end


  private
  def order_params
    params.require(:order).permit(:customer_id, :name, :order_address, :postage, :postal_code, :total_payment, :address_id, :address_option, :payment_method)
  end

end
