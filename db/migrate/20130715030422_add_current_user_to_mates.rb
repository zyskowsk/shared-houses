class AddCurrentUserToMates < ActiveRecord::Migration
  def change
    add_column :mates, :current_use, :boolean
  end
end
