class ChangeTypeOfHouseIdForMates < ActiveRecord::Migration
  def up
    connection.execute(%q{
      alter table mates
      alter column house_id
      type integer using cast(house_id as integer)
    })
  end

  def down
  end
end
