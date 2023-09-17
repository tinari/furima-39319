class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buys 
  
         validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "は英数字を含んだ半角6文字以上128文字以下で入力してください"}
         validates :name, :family_name, format: { with: /\A[ぁ-んァ-ン一-龥々ー]/, message: "は全角で入力してください"}
         validates :kana_name, :kana_family_name, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角で入力してください"}
         validates :nickname, :family_name, :name, :kana_family_name, :kana_name, :birthday, presence: true

end

