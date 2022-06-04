class Admin::OrderDetailsController < ApplicationController
  def update
    @order = Order.find(params[:id])
    @order.update(order_detail_params)
    redirect_to admin_order(@order)
  end

  private
  def order_params
    params.require(:order_detail).permit(:making_status)
  end
end
