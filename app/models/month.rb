class Month < ActiveRecord::Base
  attr_accessible :each_pay, :transactions, :total_spent, :house_id
  belongs_to :house
  has_and_belongs_to_many :mates
  has_many :items
  has_many :statements
  has_many :transactions
  
  def mates
    self.items.map do |item|
      Mate.with( name: item.name )
    end.uniq
  end 
end
