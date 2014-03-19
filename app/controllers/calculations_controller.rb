class CalculationsController < ApplicationController
  	def index
		@title = "Calculate EMI"
		@emi = Emi.new #Object #blank obj created...only for initialization.
  	end
	def show
		@title = "EMIs History"
  		@emis = Emi.all.where("uid = ?", session[:user_id])
  	end
	def calculate_emi
		@title = "Calculate EMI"
		@emi = Emi.new(emi_params)	#again object is created and here values received from params are stored. # emi_params is a function defined below
		if(cal = Emi.calculate(emi_params)) # emi_params is passed to calculate defined in emi model and result received is stored in cal
			@emi.emi = cal
			@emi.uid = session[:user_id]
			@emi.save # save to DB   # parameters to which values have been received or calculated are saved to DB and rest are stored as null. 
			if cal.nan?
				flash[:error] = 'Something went wrong!'
			else
				flash[:notice] = cal
			end
			redirect_to @domain + '/calculate'
		end
			
	end
  	private
	def emi_params
		params.require(:emi).permit(:principal_amount,:interest_rate,:payments_year,:number_installments,:residual_value)
	end
	before_filter :authenticate_user, :only => [:new, :show]
end
