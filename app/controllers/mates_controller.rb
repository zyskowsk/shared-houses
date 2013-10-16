class MatesController < ApplicationController
  before_filter :signed_in_house
  before_filter :belongs_to_house
  
  def new 
    @mate = Mate.new(params[:id])
  end
  
  def create 
    @mate = Mate.new(params[:mate])
    @mate.save!
    redirect_to house_path(current_house)
  end
  
  def show 
    @mate = Mate.find(params[:id])
    @item = Item.new(
      mate_id: @mate.id,
      house_id: @mate.house.id,
      createdonmatepage: true,
      name: @mate.name,
      current: true
    )
  end
  
  def update 
    @mate = Mate.find(params[:id])
    @mate.admin = !@mate.admin
    @mate.save
    notice: "#{@mate.name} is
             #{@mate.admin ? "now an admin" : "no longer an admin" }"

    redirect_to edit_house_registration_path, 
  end
  
  def destroy
    @mate = Mate.find(params[:id])
    @mate_name = @mate.name
    @mate.current_use = false
    @mate.save 
    flash[:success] = "#{@mate_name} deleted"

    redirect_to house_path(current_house)
  end
  
  private 

    def signed_in_house
      redirect_to root_path, notice: "Please Sign in!" unless
      house_signed_in?
    end

    def belongs_to_house
        redirect_to house_path(current_house), 
        notice: "You are not signed in to that house!" unless 
        current_house.mates.include?(Mate.find(params[:id]))
    end
end
