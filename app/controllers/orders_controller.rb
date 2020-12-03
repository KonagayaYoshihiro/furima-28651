class OrdersController < ApplicationController

  def index
    unless user_signed_in?
      redirect_to action: :index
    end

    @item = Item.find(params[:id])
  end
  
end
