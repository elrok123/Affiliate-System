class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :supplier_name
      t.string :supplier_phone_number
      t.string :supplier_postcode, :limit => 9
      t.string :supplier_address
      t.string :supplier_email

      t.timestamps
    end
  end
end
