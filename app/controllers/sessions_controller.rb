class SessionsController < ApplicationController
  	def login
  		@title = "Log in"
    	#Login Form
  	end
  	def login_attempt
		authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
		if authorized_user
		  	session[:user_id] = authorized_user.id
		  	redirect_to(:action => 'login')
		else
		  	flash[:notice] = "Invalid Username or Password"
		  	flash[:color]= "invalid"
			redirect_to :action => 'login'
		end
	end
	def logout
		session[:user_id] = nil
		redirect_to :action => 'login'
	end
	
	before_filter :authenticate_user, :only => [:home, :profile, :setting]
	before_filter :save_login_state, :only => [:login, :login_attempt]
end
