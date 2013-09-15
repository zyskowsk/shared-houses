class Need < ActiveRecord::Base
  attr_accessible :description, :house_id
  
  belongs_to :house
end
