class AddAdminToMates < ActiveRecord::Migration
  def change
    add_column :mates, :admin, :boolean
  end
end
