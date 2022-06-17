class AddOrderAddressToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :order_address, :string
  end
end
