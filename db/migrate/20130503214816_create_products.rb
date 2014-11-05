class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_name
      t.decimal :product_price, :precision => 12, :scale => 2
      t.integer :product_quantity
      t.integer :supplier_id

      t.timestamps
    end
    add_index :products, :supplier_id
  end
end
