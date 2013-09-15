class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :description
      t.string :location
      t.float :cost
      t.integer :mate_id
      t.boolean :needed
      t.boolean :purchased

      t.timestamps
    end
  end
end
