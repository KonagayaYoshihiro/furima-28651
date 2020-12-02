class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update]
  
  def index
    @items = Item.all.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if user_signed_in? && current_user.id == @item.user_id
    set_item
    else
    redirect_to item_path
    end
  end

  def update
    set_item
    @item.update(item_params)
    redirect_to item_path
  end

  def destroy
  end

  def set_item
    @item = Item.find(params[:id])
  end


  private

  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :status_id, :delivery_price_id, :delivery_area_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

end
