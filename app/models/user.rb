class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  with_options presence:true do
    validates :nickname
    validates :birth_date, presence: true
  end

  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  # 全角
  validates :first_name, format: { with: NAME_REGEX, message: "can't be blank and enter in full characters" }
  validates :last_name, format: { with: NAME_REGEX, message: "can't be blank and enter in full characters" }

  KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  # 全角カタカナ
  validates :first_name_kana, format: { with: KANA_REGEX, message: "can't be blank and enter in katakana characters" }
  validates :last_name_kana, format: { with: KANA_REGEX, message: "can't be blank and enter in katakana characters" }

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  # 半角英数字
  validates :password, format: { with: PASSWORD_REGEX, message: 'include both letters and numbers' }
end
