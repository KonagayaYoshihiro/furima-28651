class Purchase < ApplicationRecord

  # アソシエーション
  # ユーザー
  belongs_to :user
  # アイテム
  belongs_to :item

end
