class Mate < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :current_use, :email, :password, :password_confirmation,
                  :remember_me, :admin, :owes, :account
  attr_accessible :name, :house_id
  belongs_to :house
  has_many :items
  has_many :statements
  has_many :transactions
  has_and_belongs_to_many :months
  
  
  def total_spent
    @total_mate_spent = 0
    self.items.each do |item|
      if item.current?
        @total_mate_spent += item.cost
      end
    end
    @total_mate_spent
  end
  
  def pays(mate, amount, month)
    if amount == 0
      return nil
    end
    self.account -= amount
    mate.account += amount
    @trans = Transaction.new(payer: self.name,
                             reciever: mate.name,
                             amount: amount,
                             month_id: month.id, 
                             mate_id: self.id,
                             paid: false)
    @trans.save                 
  end
  
end
