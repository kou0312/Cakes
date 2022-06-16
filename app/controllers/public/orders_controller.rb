class Public::OrdersController < ApplicationController
  def new
    @cart_items = current_customer.cart_items.all
    @customer = Customer.find_by(params[:email])
    @order = Order.new
  end

  def create

    @order = Order.new(order_params)
    @order.save!
    @order.valid?
    @order.errors
    @order = Order.all
    redirect_to public_orders_confimation_path
  end

  def confimation
    @order = Order.find_by(params[:address_option])
    @cart_items = current_customer.cart_items.all
    @order = Order.new
    @order.payment_method = params[:order][:payment_method]
    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.name
    elsif params[:order][:address_option] == "1"
      @sta = params[:order][:address].to_i
      @address = Address.find(@sta)
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:address_option] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
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
    params.require(:order).permit(:customer_id, :name, :address, :postage, :postal_code, :total_payment, :address_option, :payment_method)
  end

end
