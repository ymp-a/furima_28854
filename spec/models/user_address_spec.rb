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
  end
end