class Orderedproduct < ActiveRecord::Base
	attr_accessible :order_id, :product_id, :quantity_ordered, :total_price
	belongs_to :order
	belongs_to :product

	validates_presence_of :quantity_ordered

  	def product_price
		product.product_price
	end
	def total_price
		product_price * quantity_ordered
	end
end