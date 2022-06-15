class AddAddressOptionToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :address_option, :integer
  end
end
