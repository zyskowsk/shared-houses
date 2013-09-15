class NeedsController < ApplicationController
  
  def new 
    @need = Need.new
  end
  
  def create
    Need.new(params[:need]).save
    redirect_to house_path(current_house)
  end
  
  def delete_many
    Need.destroy_all(:id => params[:need_ids])
    redirect_to house_path(current_house)
  end
  
end
