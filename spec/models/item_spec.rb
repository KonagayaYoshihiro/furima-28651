require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品出品登録がうまくいくとき' do
      it 'user_id,name,description,category_id,status_id,delivery_area_id,delivery_price_id,shipping_day_id,priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end

      it '商品名があると登録できる' do
        @item.name
        expect(@item).to be_valid
      end

      it 'カテゴリーの情報があると登録できる' do
        @item.category_id
        expect(@item).to be_valid
      end

      it '商品の状態についての情報があると登録できる' do
        @item.status_id
        expect(@item).to be_valid
      end

      it '配送料についての情報があると登録できる' do
        @item.delivery_price_id
        expect(@item).to be_valid
      end

      it '配送元地域についての情報があると登録できる' do
        @item.delivery_area_id
        expect(@item).to be_valid
      end

      it '発送日数についての情報があると登録できる' do
        @item.shipping_day_id
        expect(@item).to be_valid
      end

      it '販売価格についての情報があると登録できる' do
        @item.price
        expect(@item).to be_valid
      end

      it '販売価格が半角数字のみ登録できる' do
        @item.price
        expect(@item).to be_valid
      end
    end



    context '新規登録がうまくいかないとき' do
      it '商品名がないと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品説明がないと登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリー情報がないと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end

      it '商品状態がないと登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", "Status is not a number")
      end

      it '配送料についての情報がないと登録できない' do
        @item.delivery_price_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery price can't be blank", "Delivery price is not a number")
      end

      it '配送元地域についての情報がないと登録できない' do
        @item.delivery_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area can't be blank", "Delivery area is not a number")
      end

      it '発送日数についての情報がないと登録できない' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day is not a number")
      end

      it '価格についての情報がないと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it '販売価格が299円以下では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '販売価格が1000万円以上では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it '販売価格が大文字数字では登録できない' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end

#RSpec.describe Item, type: :model do