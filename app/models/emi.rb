class Emi < ActiveRecord::Base
	validates :principal_amount, presence: true
	validates :interest_rate, presence: true
	validates :payments_year, presence: true
	validates :number_installments, presence: true
	validates :residual_value, presence: true

	def self.calculate(emi)
		p = emi[:principal_amount].to_f
		i = emi[:interest_rate].to_f
		t = emi[:payments_year].to_f
		n = emi[:number_installments].to_f
		rv = emi[:residual_value].to_f
		r1 = r1.to_f
		r2 = r2.to_f
		r3 = r3.to_f
		x = x.to_f
		r1 = p*(i/t)
		r2 = (rv * (i/t)) / ((1.0 + (i/t))**n)
		r3 = 1.0 - (1.0 / ((1.0 + (i/t))**n))
		x = (r1 - r2)/r3
		return x
	end
end
