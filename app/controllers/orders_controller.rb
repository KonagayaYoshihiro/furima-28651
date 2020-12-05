class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    # @purchase = フォームオブジェクト.new  @item.find(params[:id])
    unless user_signed_in?
      redirect_to user_session_path
    end
  end

end
