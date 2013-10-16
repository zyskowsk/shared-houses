class Transaction < ActiveRecord::Base
  attr_accessible :month_id, :payer, :reciever, :amount, :mate_id,
                  :paid

  belongs_to :month
  belongs_to :mate 
end
