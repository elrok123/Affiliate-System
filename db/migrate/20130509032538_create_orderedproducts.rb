class CreateOrderedproducts < ActiveRecord::Migration
  def change
    create_table :orderedproducts do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity_ordered, :default => 1

      t.timestamps
    end
    add_index :orderedproducts, :order_id
    add_index :orderedproducts, :product_id
  end
end
