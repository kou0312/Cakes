class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show

  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_update_params)
    redirect_to public_customers_home_path
  end

  def confimation
    @customer = Customer.find_by(params[:email])
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_active: true)
    reset_session
    redirect_to root_path
  end

  private
    def customer_params
      params.permit(:id, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_active, :email)
    end
    def customer_update_params
      params.require(:customer).permit(:id, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_active, :email)
    end

end
