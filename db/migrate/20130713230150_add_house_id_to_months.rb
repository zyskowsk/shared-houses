class AddHouseIdToMonths < ActiveRecord::Migration
  def change
    add_column :months, :house_id, :integer
  end
end
