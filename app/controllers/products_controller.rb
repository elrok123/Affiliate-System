class ProductsController < ApplicationController
  	def new
	  @product = Product.new
	end

	def create
	  @product = Product.new(params[:product])
	  if @product.save
	    redirect_to '/products/new', :notice => "Product Created!"
	  else
	    render "new"
	  end
	end

	def view
		@products = Product.all
	end
	def edit
		@product = Product.find(params[:id])
	end
	def update
		@product = Product.find(params[:id])
		@product.update_attributes(params[:product])
		if @product.save
	    	redirect_to '/products/view', :notice => "Product Updated!"
		else
			render "new"
		end
	end
end