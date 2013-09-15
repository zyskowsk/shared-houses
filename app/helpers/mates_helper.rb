module MatesHelper
  
  def show_statements(mate)
    mate.transactions.each do |trans|
      unless trans.paid?
        return "You owe #{trans.reciever} $#{trans.amount} from the"
        link_to Month.find(trans.month_id).created_at, months_path(trans.month_id)
      end
    end
  end
    
  
end
