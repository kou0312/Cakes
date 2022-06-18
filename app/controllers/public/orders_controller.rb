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
    redirect_to public_orders_thanks_path
  end

  def confimation
    @cart_items = current_customer.cart_items.all
    @pay = params[:order][:payment_method]
    if params[:order][:address_option] == "0"
      @op = params[:order][:address_option]
      @pos = current_customer.postal_code
      @ress = current_customer.address
      @na = current_customer.lsname
    elsif params[:order][:address_option] == "1"
      @op = params[:order][:address_option]
      @sta = params[:order][:address_id]
      @address = Address.find(@sta)
      @pos = @address.postal_code
      @ress = @address.address
      @na = @address.name
    elsif params[:order][:address_option] == "2"
      @op = params[:order][:address_option]
      @pos = params[:order][:postal_code]
      @ress = params[:order][:order_address]
      @na = params[:order][:name]
    end
    @order = Order.new
  end

  def thanks
  end



  def index
    @order = Order.all
    @cart_items = current_customer.cart_item.item
  end

  def show
  end


  private
  def order_params
    params.require(:order).permit(:customer_id, :name, :order_address, :postage, :postal_code, :total_payment, :address_id, :address_option, :payment_method)
  end

end
