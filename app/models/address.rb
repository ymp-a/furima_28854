class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :deal
  belongs_to_active_hash :prefecture
end
