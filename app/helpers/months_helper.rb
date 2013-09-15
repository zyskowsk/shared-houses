module MonthsHelper
  
  def set_mate_accounts(each_owes)
    current_house.mates.each do |mate|
      mate.owes = each_owes - mate.total_spent
      mate.account = mate.owes
      mate.save
    end
  end
  
  def each_pay
    number_of_housemates = current_house.mates.length
    total_spent = current_house.total_spent 
    total_spent / [number_of_housemates,1].max
  end
  
  def who_pays_who(month)
    count = 0
    mates_pay.each do |mate|
      if count > mates_recieve.length
        return
      end
      until (mate.account.round(2) == 0)
        if (mate.account >= mates_recieve[count].account.abs) 
          mate.pays(mates_recieve[count], 
                      mates_recieve[count].account.abs, month)
        else
          mate.pays(mates_recieve[count], mate.account, month)
        end
        if mates_recieve[count].account.round(2) == 0
          count += 1
        end
      end
    end
  end
  
  def pays_or_recieves(statement)
    if statement.due_this_month > 0
      return "#{Mate.find(statement.mate_id).name} paid
              #{statement.spent_this_month} this month and owes
              #{statement.due_this_month}"
    elsif statement.due_this_month < 0
      return "#{Mate.find(statement.mate_id).name} paid
              #{statement.spent_this_month} this month and receives
              #{statement.due_this_month.abs}"
    end
  end
  
      
  
end
