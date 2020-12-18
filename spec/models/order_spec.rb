require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '住所登録' do
    context '住所登録がうまくいくとき' do
      it 'user_id, :item_id, :postal_code, :delivery_area_id, :city, :house_number, :building_name,:telephone_numberが存在すれば登録できる' do
        expect(@order).to be_valid
      end

      it "priceとtokenがあれば保存ができること" do
        expect(@order).to be_valid
      end
    end 
      
    context '住所登録がうまくいかないとき' do
      it 'ユーザーidがないと登録できない' do
        @order.user_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idがないと登録できない' do
        @order.item_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end

      it '郵便番号がないと登録できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code 半角英数、ハイフンを記入して下さい。")
      end

      it '郵便番号が文字だと登録できない' do
        @order.postal_code = '田中'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code 半角英数、ハイフンを記入して下さい。")
      end

      it '郵便番号にハイフンがないと登録できない' do
        @order.postal_code = '123456'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code 半角英数、ハイフンを記入して下さい。")
      end

      it '都道府県がないと登録できない' do
        @order.delivery_area_id =''
        @order.valid?
        expect(@order.errors.full_messages).to include("Delivery area 都道府県を入力して下さい")
      end

      it '市町村がないと登録できない' do
        @order.city =''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it '建物名がないと登録できない' do
        @order.house_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end

      it '電話番号がないと登録できない' do
        @order.telephone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone number can't be blank", "Telephone number 半角英数で入力してください")
      end

      it '電話番号が数字以外では登録できない' do
        @order.telephone_number = '田中'
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone number 半角英数で入力してください")
      end

      it "tokenが空では登録できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
 #RSpec.describe Item, type: :model 
