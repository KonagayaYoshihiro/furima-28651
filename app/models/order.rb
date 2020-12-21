class Order 
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :delivery_area_id, :house_number, :postal_code, :city, :telephone_number, :building_name, :token
  
  
  # 空の場合について
  with_options presence: true do
    validates :user_id
    validates :item_id
    #郵便番号についてのバリデーション
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: '半角英数、ハイフンを記入して下さい。'}
    #市町村についてのバリデーション
    validates :city
    #番地についてのバリデーション
    validates :house_number
    #電話番号についてのバリデーション
    validates :telephone_number, format: {with: /\A[a-zA-Z0-9]+\z/, message: '半角英数で入力してください'}
    validates :telephone_number, length: { maximum: 11 }
    #トークン情報について
    validates :token
  end
    #都道府県についてのバリデーション
  validates :delivery_area_id, numericality: { other_than: 0, message: '都道府県を入力して下さい' }

  def save
    # 購入者を保存
    #purchaseのidをAddressで取得したい場合は、変数にpurchaseを代入する必要がある。
    @purchase = Purchase.create(user_id: user_id, item_id: item_id)
    # 住所情報を保存。
    Address.create!(purchase_id: @purchase.id,postal_code: postal_code, delivery_area_id: delivery_area_id, city: city, house_number: house_number, building_name: building_name, telephone_number:telephone_number)
  end
end

#備忘録：createアクションに！をつけるとエラー箇所がわかる。例：create!