class Order < ActiveRecord::Base
	has_many :orderedproducts
	has_many :products, through: :orderedproducts
	has_one :client

	attr_accessible :client_id, :order_total, :delivery_date, :orderedproducts, :orderedproducts_attributes , :user_id

	accepts_nested_attributes_for :orderedproducts, :allow_destroy => true
	
	validates_presence_of :orderedproducts
	before_save :validate_quantity
	before_save :generate_total

	def generate_total
		self.order_total = self.orderedproducts.map(&:total_price).sum
	end
	def validate_quantity
		orderedproducts.each do |orderedproduct|
			orderedproduct.quantity_ordered = 1 if orderedproduct.quantity_ordered < 1
		end
	end
end