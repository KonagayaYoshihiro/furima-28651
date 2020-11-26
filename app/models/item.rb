class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

#アソシエーション
#ユーザー
belongs_to :user
#カテゴリー
belongs_to :category
#商品の状態
belongs_to :status
#送料
belongs_to :delivery_price
#都道府県
belongs_to :delivery_area
#配送日
belongs_to :shipping_day
#画像
has_one_attached :image

def was_attached?
  self.image.attached?
end
 
#belongs_to :purchase
#validates :content, presence: true

with_options presence: true do
 validates :image
 validates :name
 validates :description
 validates :category_id
 validates :status_id
 validates :delivery_price_id
 validates :delivery_area_id
 validates :shipping_day_id
end

with_options numericality: { other_than: 1 } do
  validates :category_id 
  validates :status_id
  validates :delivery_price_id
  validates :delivery_area_id
  validates :shipping_day_id
end

validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }


end

#都道府県(備忘録) 
 #belongs_to :prefecture
 #validates :prefecture_id, presence: true
 #validates :prefecture_id, numericality: { other_than: 1 } 
