require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'nicknameが6文字以上で登録できる' do
        @user.nickname
        @user.valid?
      end

      it 'emailは＠が入力されている場合登録できる' do
        @user.email
        @user.valid?
      end

      it 'passwordが6文字以上で半角英数字があれば登録できる' do
        @user.password
        @user.valid?
      end

      it '苗字が全角の場合のみ登録できる' do
        @user.last_name
        @user.valid?
      end

      it '名前が全角の場合のみ登録できる' do
        @user.first_name
        @user.valid?
      end

      it '苗字の振り仮名がカタカナ全角の場合のみ登録できる' do
        @user.last_name_kana
        @user.valid?
      end

      it '苗字の振り仮名がカタカナ全角の場合のみ登録できる' do
        @user.first_name_kana
        @user.valid?
      end

      it '苗字の振り仮名がカタカナ全角の場合のみ登録できる' do
        @user.birthday
        @user.valid?
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailに@がないと登録できない' do
        @user.email = 'aaagmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが英字だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが数字だけでは登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '苗字が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it '苗字が半角英数字では登録できない' do
        @user.last_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角ひらがな、全角カタカナ、全角漢字のみ入力可能")
      end

      it '名前が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it '苗字（フリガナ）が空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana 全角カタカナのみ入力可能")
      end
      
      it '苗字（フリガナ）が全角カタカナ以外では登録できない' do
        @user.last_name_kana = 'namae'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カタカナのみ入力可能")
      end

      it '名前（フリガナ）が空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana 全角カタカナのみ入力可能")
      end

      it '名前（フリガナ）が全角カタカナ以外では登録できない' do
        @user.first_name_kana = 'namae'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カタカナのみ入力可能")
      end

      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
