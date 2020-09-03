require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item) # Itemのインスタンス生成
    @item.image = fixture_file_upload('public/images/hukuroudrill.jpeg')
  end

  describe '商品出品登録' do
    it '画像は1枚必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が必須であること' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品説明が必須であること' do
      @item.item_descrption = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item descrption can't be blank")
    end
    it 'カテゴリー情報が必須であること' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Category is not a number')
    end
    it '商品状態の情報が必須であること' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Status is not a number')
    end
    it '発送料負担の情報が必須であること' do
      @item.cost_bearer_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Cost bearer is not a number')
    end
    it '発送元地域の情報が必須であること' do
      @item.consignor_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Consignor is not a number')
    end
    it '発送までの日数情報が必須であること' do
      @item.delivery_date_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery date is not a number')
    end
    it '価格についての情報が必須であること' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it '価格の範囲が、¥300~¥9,999,999の間であること(300未満)' do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it '価格の範囲が、¥300~¥9,999,999の間であること(10,000,000以上)' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
    it '販売価格は半角数字のみ入力可能であること' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end
