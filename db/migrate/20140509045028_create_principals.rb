class CreatePrincipals < ActiveRecord::Migration
  def change
    create_table :principals do |t|
    	t.integer  :uid
		  t.float    :in
      	t.float    :pn
      	t.float    :opn1
      	t.float    :installment
      	t.float    :principal1
      	t.float    :interest2
      	t.timestamps
    end
  end
end