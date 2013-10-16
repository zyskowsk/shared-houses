class Item < ActiveRecord::Base
  attr_accessible :cost, :description, :location, 
                  :mate_id, :name, :createdonmatepage,
                  :house_id, :current
  
  validates_presence_of :cost, :description, :location
                  
  belongs_to :mate
  belongs_to :house
end
