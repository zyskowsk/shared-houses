class Statement < ActiveRecord::Base
  attr_accessible :due_this_month, :mate_id, :month_id, :spent_this_month
  belongs_to :month
  belongs_to :mate
end
