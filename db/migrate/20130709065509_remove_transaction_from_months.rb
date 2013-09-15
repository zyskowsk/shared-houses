class RemoveTransactionFromMonths < ActiveRecord::Migration
  def change 
    remove_column :months, :transactions
  end
  
end
