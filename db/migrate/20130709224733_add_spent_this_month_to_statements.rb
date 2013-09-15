class AddSpentThisMonthToStatements < ActiveRecord::Migration
  def change
    add_column :statements, :spent_this_month, :float
  end
end
