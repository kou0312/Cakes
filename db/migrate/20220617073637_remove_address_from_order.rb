class RemoveAddressFromOrder < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :address, :string
  end
end
