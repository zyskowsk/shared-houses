class AddMateMonthTable < ActiveRecord::Migration
  def up
    create_table 'mates_months', :id => :false do |t|
      t.column :mate_id, :integer
      t.column :month_id, :integer
    end
  end

  def down
    drop_table 'mates_months'
  end
end
