class AddHouseIdToItem < ActiveRecord::Migration
  def change
    add_column :items, :house_id, :integer
  end
end
