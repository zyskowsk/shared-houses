class MonthsController < ApplicationController
  protect_from_forgery 
  before_filter :signed_in_house
  before_filter :belongs_to_house, :only => [:show]
  
  include ApplicationHelper 
  include MonthsHelper
   
  def show
    @month = Month.find(params[:id])
  end
  
  def index
    @months = Month.all
  end
  
  def create
    set_mate_accounts(each_pay)
    @month = Month.new(
      each_pay: each_pay,
      total_spent: current_house.total_spent,
      house_id: current_house.id
    ) 
    @month.save
    
    create_statements(@month)
    who_pays_who(@month)
    associate_current_items_to_month(@month.id)
    associate_month_to_current_mates(@month)

    remove_current_items
    redirect_to month_path(@month)     
  end
  
  private 

    def signed_in_house
      redirect_to root_path, notice: "Please Sign in!" unless
      house_signed_in?
    end

    def belongs_to_house
        redirect_to house_path(current_house), 
        notice: "You are not signed in to that house!" unless 
        Month.find(params[:id]).house_id == current_house.id
    end
  
end
