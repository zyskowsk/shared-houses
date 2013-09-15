class AddTotalSpentToMonth < ActiveRecord::Migration
  def change
    add_column :months, :total_spent, :float
  end
end
