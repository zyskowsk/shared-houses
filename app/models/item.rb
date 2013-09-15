class Item < ActiveRecord::Base
  validates_presence_of :cost, :description, :location
  attr_accessible :cost, :description, :location, 
                  :mate_id, :name, :createdonmatepage,
                  :house_id, :current
                  
  belongs_to :mate
  belongs_to :house
end
