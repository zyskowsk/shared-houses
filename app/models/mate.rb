class Mate < ActiveRecord::Base
  attr_accessible :current_use, :email, :password, :password_confirmation,
                  :remember_me, :admin, :owes, :account, :name, :house_id
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  belongs_to :house

  has_many :items
  has_many :statements
  has_many :transactions

  has_and_belongs_to_many :months 
  
  def total_spent
    @total_mate_spent = 0
    self.items.each do |item|
      @total_mate_spent += item.cost if item.current?
    end

    @total_mate_spent
  end

  # Some of this logic could go elsewhere
  def pays(mate, amount, month)
    return nil if amount == 0
  
    self.account -= amount
    mate.account += amount

    @trans = Transaction.create(
      payer: self.name,
      reciever: mate.name,
      amount: amount,
      month_id: month.id, 
      mate_id: self.id,
      paid: false
    )               
  end
  
end
