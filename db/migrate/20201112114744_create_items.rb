class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      #カラム
      t.references :user,                            foreign_key: true
      t.string     :name,                            null: false
      t.text       :description,                     null: false
      t.integer    :category_id,                     null: false
      t.integer    :status_id,                       null: false
      t.integer    :delivery_area_id,                null: false
      t.integer    :delivery_price_id,               null: false
      t.integer    :shipping_day_id,                 null: false
      t.string     :price,                           null: false

      #タイムスタンプ
      t.timestamps

      #t.integer    :image,                       null: false
    end
  end
end
