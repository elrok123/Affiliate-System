class SessionsController < ApplicationController
	def new
	end

	def create
		check = User.find_by_email(params[:email])
	  	unless params[:email] == "Email" || params[:email] == "email" || !check
	  		user = User.authenticate(params[:email], params[:password])
		  	if user
		    	session[:user_id] = user.id
		    	redirect_to root_url, :notice => "Logged in!"
		  	else
		    	flash.now.alert = "Invalid email or password"
		    	render "new"
		  	end
		else
		    redirect_to root_url, :alert => "Invalid email or password"
	  	end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "Logged out!"
	end
end
