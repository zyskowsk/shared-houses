class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :payer
      t.string :reciever
      t.integer :month_id

      t.timestamps
    end
  end
end
