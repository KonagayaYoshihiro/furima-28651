class OrdersController < ApplicationController
  before_action :authenticate_user!,only: [:index]
  before_action :item_find, only: [:index, :create]

  def index
    if current_user.id == @item.user_id || @item.purchase.present?
      redirect_to root_path
      #present?は「存在したら」の意味
    end
    #「商品に紐づく購入情報が存在」 || 「current_userと商品の出品者が一致」
      @purchase_addresses = Order.new
  end

  def create
    @purchase_addresses = Order.new(purchase_addresses_params)
    if @purchase_addresses.valid?
       payjp
       @purchase_addresses.save
       redirect_to root_path
    else
       render action: :index
    end
  end

  private

  def purchase_addresses_params
    params.require(:order).permit(:user_id, :item_id, :postal_code, :delivery_area_id, :city, :house_number, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def payjp
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
       amount: @item.price,  # 商品の値段
       card: purchase_addresses_params[:token],    # カードトークン
       currency: 'jpy'                 # 通貨の種類（日本円）
     )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

end

  #備忘録・・・item_id:item_idの左側は、「def purchase_addresses_params」に紐付けるためのもの、右側のitem_idはparamsのキーの名前
  #備忘録・・・attribute（属性）＝ほぼカラム名のこと
