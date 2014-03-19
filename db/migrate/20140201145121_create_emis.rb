class CreateEmis < ActiveRecord::Migration
  def change
    create_table :emis do |t|
			t.integer	 :uid
			t.float    :emi
      t.float    :principal_amount
      t.float    :interest_rate
      t.float    :payments_year
      t.float    :number_installments
      t.float    :residual_value
      t.timestamps
    end
  end
end
