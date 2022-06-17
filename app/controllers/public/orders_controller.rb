class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @cart_items = current_customer.cart_items.all
    @customer = Customer.find_by(params[:email])

  end

  def create
    @order = Order.new(order_params)
    @order.save!
    @order.valid?
    @order.errors
    redirect_to public_orders_confimation_path
  end

  def confimation
    binding.pry
    @cart_items = current_customer.cart_items.all
    @pay = params[:order][:payment_method]

    @order = Order.new
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
