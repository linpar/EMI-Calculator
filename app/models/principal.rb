class Principal < ActiveRecord::Base
	validates :installment, presence: true
	validates :principal1, presence: true
	validates :interest2, presence: true
	
	def self.calculate(params)
		i = params[:installment].to_f
		p1 = params[:principal1].to_f
		i2 = params[:interest2].to_f
		r1 = r1.to_f
		p1 = p1.to_f
		i2 = i2.to_f
		r1 = p1 * (i2/100.00) * (1.0/12.0)
		r2 = i - r1
		r3 = p1 - r2
		x = [r1, r2, r3]
		return x
	end
end

