require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

  describe '商品購入機能' do
    it '配送先情報、郵便番号が必須であること' do
      @address.postalcode = nil
      @address.valid?
      expect(@address.errors.full_messages).to include('Deal must exist')
    end
    it '都道府県が必須であること' do
      @address.prefecture_id = nil
      @address.valid?
      expect(@address.errors.full_messages).to include('Deal must exist')
    end
    it '市区町村が必須であること' do
      @address.city = nil
      @address.valid?
      expect(@address.errors.full_messages).to include('Deal must exist')
    end
    it '番地が必須であること' do
      @address.address = nil
      @address.valid?
      expect(@address.errors.full_messages).to include('Deal must exist')
    end
    it '電話番号が必須であること' do
      @address.phone_number = nil
      @address.valid?
      expect(@address.errors.full_messages).to include('Deal must exist')
    end
    it '郵便番号にはハイフンが必要であること（123-4567となる)' do
      @address.postalcode = '1111111'
      @address.valid?
      expect(@address.errors.full_messages).to include('Deal must exist')
    end
    it '電話番号にはハイフンは不要で、11桁以内であること' do
      @address.phone_number = '111-111111-111'
      @address.valid?
      expect(@address.errors.full_messages).to include('Deal must exist')
    end
  end
end
