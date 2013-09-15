class CreateNeeds < ActiveRecord::Migration
  def change
    create_table :needs do |t|
      t.string :description
      t.integer :house_id

      t.timestamps
    end
  end
end
