class AddMatePageToItem < ActiveRecord::Migration
  def change
    add_column :items, :createdonmatepage, :boolean
  end
end
