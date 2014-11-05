class SuppliersController < ApplicationController
	def new
	  @supplier = Supplier.new
	end

	def create
	  @supplier = Supplier.new(params[:supplier])
	  if @supplier.save
	    redirect_to '/suppliers/new', :notice => "Supplier Created!"
	  else
	    render "new"
	  end
	end
	def view
		@suppliers = Supplier.all
	end
	def edit
		@supplier = Supplier.find(params[:id])
	end
	def update
		@supplier = Supplier.find(params[:id])
		@supplier.update_attributes(params[:product])
		if @supplier.save
	    	redirect_to '/suppliers/view', :notice => "Supplier Updated!"
		else
			render "new"
		end
	end
end
