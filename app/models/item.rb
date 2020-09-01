class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :cost_bearer
  belongs_to_active_hash :consignor
  belongs_to_active_hash :delivery_date
  
  belongs_to :user
  # has_one :deal
  has_one_attached :image


  #空の投稿を保存できないようにする
  with_options presence: true do
    validates :name
    validates :item_descrption
    validates :category
    validates :status
    validates :cost_bearer
    validates :consignor
    validates :delivery_date
    validates :price
  end

  #ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :cost_bearer_id
    validates :consignor_id
    validates :delivery_date_id  
  end


end
