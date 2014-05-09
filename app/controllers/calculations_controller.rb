class CalculationsController < ApplicationController
  	def index
		@title = "Calculate EMI"
		@emi = Emi.new #Object #blank obj created...only for initialization.
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
				flash[:success] = cal
			end
			redirect_to @domain + '/emi'
		end	
	end

  	def principal
  		@title = "Calculate Principal and Interest Component"
  	end

	def calculate_principal
		@title = "Calculate Principal and Interest Component"
		@principal = Principal.new(principal_params)
		if(cal = Principal.calculate(principal_params)) # emi_params is passed to calculate defined in emi model and result received is stored in cal
			@principal.in = cal[0]
			@principal.pn = cal[1]
			@principal.opn1 = cal[2]
			@principal.uid = session[:user_id]
			@principal.save
			session[:cal_array] = cal
		end
		redirect_to @domain + '/principal'
	end

	def principal_history
		@title = "Principals History"
  		@principals = Principal.all.where("uid = ?", session[:user_id])
	end

	def show
		@title = "EMIs History"
  		@emis = Emi.all.where("uid = ?", session[:user_id])
  	end


	def delete_principal
		if(Principal.destroy(params[:id]))
			flash[:success] = 'Entry deleted'
		end
		redirect_to @domain + '/principal_history'
	end

	def delete
		if(Emi.destroy(params[:id]))
			flash[:success] = 'Entry deleted'
		end
		redirect_to @domain + '/emi_history'
	end

  	private
	def emi_params
		params.require(:emi).permit(:principal_amount,:interest_rate,:payments_year,:number_installments,:residual_value)
	end

  	private
	def principal_params
		params.require(:emi).permit(:installment,:interest1,:principal1,:interest2,:principal2,:principal3)
	end
	before_filter :authenticate_user, :only => [:new, :show]
end
