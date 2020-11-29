class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show]
  
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
    #@items_params = params[:id]
    #@seller = Item.find(user_id)
    #@name = Item.find(description)
    #@category = Item.find(category_id)
    #@status = Item.find(status_id)
    #@delivery_area = Item.find(delivery_area)

    @item_params = Item.find(params[:id])

  end

  def edit
  end

  def destroy
  end



  private

  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :status_id, :delivery_price_id, :delivery_area_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end


end
