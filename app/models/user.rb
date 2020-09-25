class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, length: { minimum: 6},
                       format: {
                         with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  with_options presence: true do
    validates :nickname
    validates :birthday
  end
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/                      
  with_options presence: true, format: { with: VALID_NAME_REGEX } do
    validates :family_name
    validates :last_name
  end
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  with_options presence: true, format: { with: VALID_NAME_KANA_REGEX } do
    validates :family_name_kana
    validates :last_name_kana
  end
end
