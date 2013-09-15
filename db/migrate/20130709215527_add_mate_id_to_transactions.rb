class AddMateIdToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :mate_id, :integer
  end
end
