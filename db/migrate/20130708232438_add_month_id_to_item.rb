class AddMonthIdToItem < ActiveRecord::Migration
  def change
    add_column :items, :month_id, :integer
  end
end
