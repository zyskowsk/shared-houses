class AddCurrentToItem < ActiveRecord::Migration
  def change
    add_column :items, :current, :boolean
  end
end
