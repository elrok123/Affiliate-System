class Product < ActiveRecord::Base
	#This line makes these elements accessible outside of the class.
	attr_accessible :product_name, :product_price, :product_quantity, :supplier_id

	has_many :orderedproducts
	#has_many :orders, through: :orderedproducts
	belongs_to :supplier

	#These attributes ensure that the data entered for each element is valid and present.
	validates_presence_of :product_name
	validates_presence_of :product_price
	validates_numericality_of :product_price
	validates_presence_of :product_quantity
	validates_numericality_of :product_quantity
	validates_presence_of :supplier_id

end