class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :email
      t.string :firstname
      t.string :surname
      t.string :address
      t.string :city
      t.string :postcode
      t.string :phone_number
      t.string :company

      t.timestamps
    end
  end
end
