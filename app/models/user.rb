class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}+\z/i.freeze
         validates :name, :family_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/}
         validates :kana_name, :kana_family_name, format: { with: /\A[ァ-ヶー－]+\z/}
         validates :nickname, :family_name, :name, :kana_family_name, :kana_name, :birthday, presence: true

end

