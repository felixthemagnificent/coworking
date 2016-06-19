class ChangeTypeToCustomerTypeInCustomer < ActiveRecord::Migration
  def change
  	rename_column :customers, :type, :customer_type	
  end
end
