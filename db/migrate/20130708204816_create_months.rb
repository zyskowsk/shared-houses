class CreateMonths < ActiveRecord::Migration
  def change
    create_table :months do |t|
      t.string :transactions
      t.float :each_pay

      t.timestamps
    end
  end
end
