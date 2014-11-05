# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130511123724) do

  create_table "clients", :force => true do |t|
    t.string   "email"
    t.string   "firstname"
    t.string   "surname"
    t.string   "address"
    t.string   "city"
    t.string   "postcode"
    t.string   "phone_number"
    t.string   "company"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "orderedproducts", :force => true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "quantity_ordered", :default => 1
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "orderedproducts", ["order_id"], :name => "index_orderedproducts_on_order_id"
  add_index "orderedproducts", ["product_id"], :name => "index_orderedproducts_on_product_id"

  create_table "orders", :force => true do |t|
    t.integer  "client_id"
    t.integer  "user_id"
    t.decimal  "order_total",   :precision => 12, :scale => 2
    t.date     "delivery_date"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  add_index "orders", ["client_id"], :name => "index_orders_on_client_id"

  create_table "products", :force => true do |t|
    t.string   "product_name"
    t.decimal  "product_price",    :precision => 12, :scale => 2
    t.integer  "product_quantity"
    t.integer  "supplier_id"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  add_index "products", ["supplier_id"], :name => "index_products_on_supplier_id"

  create_table "suppliers", :force => true do |t|
    t.string   "supplier_name"
    t.string   "supplier_phone_number"
    t.string   "supplier_postcode",     :limit => 9
    t.string   "supplier_address"
    t.string   "supplier_email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "firstname"
    t.string   "surname"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
