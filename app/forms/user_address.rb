class UserAddress
  include ActiveModel::Model
  attr_accessor :token, :price, :postalcode, :prefecture_id, :city, :address,
                :building_name, :phone_number, :item_id, :user_id, :deal_id

  with_options presence: true do
    validates :token
    # 「住所」の郵便番号に関するバリデーション
    validates :postalcode, format: { with: /\A[0-9]{3}(-)[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{,11}\z/,
                                       message: 'is invalid. hyphen(-) cannot be included or must be within 11 digits' }
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    # ユーザーの情報を保存し、「user」という変数に入れている    # 落札者、落札物の情報を保存
    deal = Deal.create(user_id: user_id, item_id: item_id)

    # 住所の情報を保存
    Address.create(postalcode: postalcode, prefecture_id: prefecture_id, city: city,
                   address: address, building_name: building_name, phone_number: phone_number, deal_id: deal.id)
  end
end
