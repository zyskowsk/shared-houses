class CreateStatements < ActiveRecord::Migration
  def change
    create_table :statements do |t|
      t.integer :month_id
      t.integer :mate_id
      t.float :due_this_month

      t.timestamps
    end
  end
end
