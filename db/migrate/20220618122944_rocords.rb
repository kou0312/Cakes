class Rocords < ActiveRecord::Migration[6.1]
  def change
    drop_table :order_carts
  end
end
