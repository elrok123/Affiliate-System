class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :client_id
      t.integer :user_id
      t.decimal :order_total, :precision => 12, :scale => 2
      t.date :delivery_date

      t.timestamps
    end
    add_index :orders, :client_id
  end
end