class AddOwesAndAccountToMate < ActiveRecord::Migration
  def change
    add_column :mates, :owes, :float
    add_column :mates, :account, :float
  end
end
