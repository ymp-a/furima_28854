require 'rails_helper'

RSpec.describe UserAddress, type: :model do
  before do
    @user_address = FactoryBot.build(:user_address)
  end

  describe '商品購入機能' do
    it 'クレジットカード情報は必須であり、正しいクレジットカードの情報で無いときは決済できないこと' do
      @user_address.token = nil
      @user_address.valid?
      expect(@user_address.errors.full_messages).to include("Token can't be blank")
    end
    it '配送先情報、郵便番号が必須であること' do
      @user_address.postalcode = nil
      @user_address.valid?
      expect(@user_address.errors.full_messages).to include("Postalcode can't be blank")
    end
    it '都道府県が必須であること' do
      @user_address.prefecture_id = nil
      @user_address.valid?
      expect(@user_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町村が必須であること' do
      @user_address.city = nil
      @user_address.valid?
      expect(@user_address.errors.full_messages).to include("City can't be blank")
    end
    it '番地が必須であること' do
      @user_address.address = nil
      @user_address.valid?
      expect(@user_address.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が必須であること' do
      @user_address.phone_number = nil
      @user_address.valid?
      expect(@user_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it '郵便番号にはハイフンが必要であること（123-4567となる)' do
      @user_address.postalcode = '1111111'
      @user_address.valid?
      expect(@user_address.errors.full_messages).to include('Postalcode is invalid.
                                                                Include hyphen(-)')
    end
    it '電話番号にはハイフンは不要であること' do
      @user_address.phone_number = '123-4567-8901'
      @user_address.valid?
      expect(@user_address.errors.full_messages).to include('Phone number is invalid.
                            hyphen(-) cannot be included or must be within 11 digits')
    end
    it '電話番号は11桁以内であること' do
      @user_address.phone_number = '1234567890111111111'
      @user_address.valid?
      expect(@user_address.errors.full_messages).to include('Phone number is invalid.
                            hyphen(-) cannot be included or must be within 11 digits')
    end
  end
end
