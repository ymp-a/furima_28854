class Item < ApplicationRecord
  belongs_to :user
  # has_one :deal
  has_one_attached :image

  
end
