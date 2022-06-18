class CreateOrderCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :order_carts do |t|

      t.integer :cart_item_id
      t.integer :item_id, null: false
      t.integer :order_id, null: false
      t.integer :customer_id, null: false
      t.integer :amount, null: false

      t.timestamps
    end
  end
end
