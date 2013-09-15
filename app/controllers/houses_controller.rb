class HousesController < ApplicationController
  before_filter :signed_in_house
  before_filter :has_house_access, :only => [:show]
  
  def new
    redirect_to root_path
  end
  
  def show
    @house = params[:id] ? House.find(params[:id]) : current_house
    # Cant get before filter to work
    @mate = Mate.new(house_id: current_house.id)
    @item = Item.new(house_id: current_house.id, 
                     createdonmatepage: false,
                     current: true)
    @need = Need.new(house_id: current_house.id)
    @month = Month.new
  end
  
  private
  
  def has_house_access
    if params[:id]
      unless House.find(params[:id]) == current_house
        redirect_to root_path, notice: "You are not signed into that house!" 
      end
    end
  end
  
  def signed_in_house
    redirect_to root_path, notice: "Please sign in." unless house_signed_in?
  end
  
end
