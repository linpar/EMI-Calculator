class UsersController < ApplicationController
	def new
		@title = "Sign up"
		@user = User.new 
	end
	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "You signed up successfully"
		end
		render "new"
	end

	def index
    	@user = User.find(session[:user_id])
  		@title = "Welcome " + @user.username
	end

  	def show
  		@user = User.find(session[:user_id])
		@title = @user.username + "'s Profile"
  	end

  	private
  	def user_params
    	params.require(:user).permit(:username, :email, :password, :salt, :encrypted_password)
  	end
	before_filter :save_login_state, :only => [:new, :create]
	before_filter :authenticate_user, :only => [:show, :index]
end
