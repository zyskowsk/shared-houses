class TransactionsController < ApplicationController
  
  def update
    @trans = Transaction.find(params[:id])
    @trans.paid = true
    @trans.save
    redirect_to mate_path(@trans.mate_id)
  end
  
end
