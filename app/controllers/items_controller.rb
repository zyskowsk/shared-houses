class ItemsController < ApplicationController
  def new 
    @item = Item.new
  end
  
  def create
    @item = Item.new(params[:item])
    @item.save!
    if @item.createdonmatepage == true
      redirect_to mate_path(@item.mate)
    else
      redirect_to house_path(current_house)
    end
  end
  
  def show
    redirect_to house_path(current_house)
  end
  
  def destroy
    @item = Item.find(params[:id])
    @mate = @item.mate
    @item.destroy
    redirect_to mate_path(@mate)
  end
  
  def delete_many
    Item.destroy_all(:id => params[:item_ids])
    redirect_to house_path(current_house)
  end
  
end
