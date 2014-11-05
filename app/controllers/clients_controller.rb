class ClientsController < ApplicationController
	def new
	  @client = Client.new
	end

	def create
	  @client = Client.new(params[:client])
	  if @client.save
	    redirect_to '/clients/new', :notice => "Client Created!"
	  else
	    render "new"
	  end
	end
	def view
		@clients = Client.all
	end
	def edit
		@client = Client.find(params[:id])
	end
	def update
		@client = Client.find(params[:id])
		@client.update_attributes(params[:client])
		if @client.save
	    	redirect_to '/clients/view', :notice => "Client Updated!"
		else
			render "new"
		end
	end
end
