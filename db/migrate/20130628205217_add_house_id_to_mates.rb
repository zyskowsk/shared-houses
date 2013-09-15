class AddHouseIdToMates < ActiveRecord::Migration
  def change
    add_column :mates, :house_id, :integer
  end
end
