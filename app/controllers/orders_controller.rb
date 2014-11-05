class OrdersController < ApplicationController
	def view
		@orders = Order.all
	end

	def new
		@order = Order.new
		@suppliers = Supplier.all
	  	@products = Product.all
	end
	def create
	  	@order = Order.new(params[:order])
		if @order.save
			@order.orderedproducts.each do |orderedproduct|
				@product = Product.find(orderedproduct.product_id)
				@product.update_attributes(:product_quantity => (@product.product_quantity - orderedproduct.quantity_ordered)) unless orderedproduct.quantity_ordered > @product.product_quantity
			end
			redirect_to '/orders/view', :notice => "Order Created!"
		else
			render "new"
		end
	end
	def show
		@order = Order.find(params[:id])
		@client = Client.find(@order.client_id)
		@orderedproducts = Orderedproduct.where(:order_id => @order.id)
		@salesperson = User.find(@order.user_id)
	end
end