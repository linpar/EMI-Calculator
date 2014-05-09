class ApplicationController < ActionController::Base
  	# Prevent CSRF attacks by raising an exception.
  	# For APIs, you may want to use :null_session instead.
  	protect_from_forgery with: :exception
  	before_filter :initialize_support

	def initialize_support
      	@domain = "http://" + request.domain + ":3000"
      	@current_url = request.original_url
		if @current_url == @domain + '/home'
			@home_class = 'class="active"'
		elsif @current_url == @domain + '/profile'
			@profile_class = 'class="active"'
		elsif @current_url == @domain + '/emi'
			@emi_class = 'class="active"'
			@emi_calculate_class = 'class="active"'
		elsif @current_url == @domain + '/principal'
			@emi_class = 'class="active"'
			@principal_calculate_class = 'class="active"'
		elsif @current_url == @domain + '/emi_history'
			@emi_class = 'class="active"'
			@emi_history_class = 'class="active"'
		elsif @current_url == @domain + '/principal_history'
			@emi_class = 'class="active"'
			@principal_history_class = 'class="active"'
		end

		if session[:user_id]
			@display_menu = true
		else
			@display_menu = false
		end
	end
	protected
	def authenticate_user
		if session[:user_id]
		   # set current user object to @current_user object variable
		  @current_user = User.find(session[:user_id])
		  return true	
		else
		  redirect_to(:controller => 'sessions', :action => 'login')
		  return false
		end
	end
	def save_login_state
		if session[:user_id]
		  	redirect_to @domain + '/home'
		  	return false
		else
		  	return true
		end
	end
end
