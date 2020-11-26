class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def destroy
  end
<<<<<<< Updated upstream
=======


  private

  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :status_id, :delivery_price_id, :delivery_area_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def items_params
    params.require(:item).permit(:image)
  end

>>>>>>> Stashed changes
end
