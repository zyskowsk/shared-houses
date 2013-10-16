class Month < ActiveRecord::Base
  attr_accessible :each_pay, :transactions, :total_spent, :house_id

  belongs_to :house

  has_many :items
  has_many :statements
  has_many :transactions
  
  has_and_belongs_to_many :mates

  #what is the purpose of this method?
  def mates
    self.items.map do |item|
      Mate.with( name: item.name )
    end.uniq
  end 
end
