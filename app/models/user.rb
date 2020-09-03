class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  # has_many :deals

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  with_options presence: true do
    validates :nickname
    validates :birthdate
    validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角6文字以上の英数字を含める必要があります' }
  end
  with_options presence: true, format: { with: VALID_NAME_REGEX, message: '全角文字を使用してください' } do
    validates :last_name
    validates :first_name
  end
  with_options presence: true, format: { with: VALID_KANA_REGEX, message: '全角カナ文字を使用してください' } do
    validates :kana_last_name
    validates :kana_first_name
  end
end
