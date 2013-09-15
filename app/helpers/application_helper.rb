module ApplicationHelper
  
  def remove_current_items
    current_house.items.each do |item|
      item.current = false
      item.save
    end
  end
  
  def associate_current_items_to_month(month_id)
    current_house.items.each do |item|
      if item.current? 
        item.month_id = month_id
        item.save
      end
    end  
  end
  
  def associate_month_to_current_mates(month)
    current_house.mates.each do |mate|
      mate.months << month
      mate.save
    end
  end
  
  def create_statements(month)
    current_house.mates.each do |mate|
      @stat = Statement.new(mate_id: mate.id,
                            month_id: month.id,
                            due_this_month: mate.owes,
                            spent_this_month: mate.total_spent)
      @stat.save
    end
  end
  
  def mates_pay 
    @mates_pay = []
    current_house.mates.each do |mate|
      if (mate.owes > 0)
        @mates_pay << mate
      end
    end
    @mates_pay
  end
  
  def statements_pay(month)
    @statements_pay = []
    month.statements.each do |stat|
      if (stat.due_this_month > 0)
        @statements_pay << stat
      end
    end
    @statements_pay
  end
  
  def statements_recieve(month)
    @statements_recieve = []
    month.statements.each do |stat|
      if (stat.due_this_month < 0)
        @statements_recieve << stat
      end
    end
    @statements_recieve
  end
  
  def mates_recieve
    @mates_recieve = []
    current_house.mates.each do |mate|
      if (mate.owes < 0 )
        @mates_recieve << mate
      end
    end
    @mates_recieve
  end
  
  def number_of_mates
    [current_house.mates.length, 1].max
  end
  
  def owes_currently(mate)
		@total_house = current_house.total_spent
		@total_mate = mate.total_spent
		@each_owe = ( @total_house / number_of_mates )
		@balance = @each_owe - @total_mate
  end
  
  def resource_name
     :mate
  end
  
  def house_resource_name
    :house
  end
  
  def house_resource
    @resource ||= House.new
  end
  
  def house_devise_mapping
    @devise_mapping ||= Devise.mappings[:house]
  end

   def resource
     @resource ||= Mate.new
   end

   def devise_mapping
     @devise_mapping ||= Devise.mappings[:mate]
   end 
  
end
