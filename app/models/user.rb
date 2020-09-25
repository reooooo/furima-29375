class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, length: { minimum: 6},
                       format: {
                         with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  with_options presence: true do
    validates :nickname, 
    validates :birthday, 
    VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
    VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
    validates :family_name, format: { with: VALID_NAME_REGEX }
    validates :last_name, format: { with: VALID_NAME_REGEX }
    validates :family_name_kana, format: { with: VALID_NAME_KANA_REGEX }
    validates :last_name_kana, format: { with: VALID_NAME_KANA_REGEX }
  end

end
