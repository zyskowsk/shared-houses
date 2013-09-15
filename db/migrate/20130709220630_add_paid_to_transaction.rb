class AddPaidToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :paid, :boolean
  end
end
