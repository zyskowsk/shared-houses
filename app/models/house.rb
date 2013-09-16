class House < ActiveRecord::Base
  attr_accessor :login
 
  attr_accessible :city, :address, :email, :password, 
                  :password_confirmation, :remember_me,
                  :login
                  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]
         
  has_many :mates
  has_many :items
  has_many :needs
  has_many :months
  
  validates_presence_of :city, :address, :email
  validates_uniqueness_of  :address, :email, :case_sensitive => false
  
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where([
        "lower(address) = :value OR lower(email) = :value", 
        { :value => login.downcase }
      ]).first
     else
       where(conditions).first
     end
   end
   
  def total_spent 
    @total_spent = 0
    self.items.each do |item|
      @total_spent += item.cost if item.current?
    end
    
    @total_spent
  end
   
end
