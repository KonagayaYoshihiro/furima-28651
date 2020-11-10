class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birthday, presence: true

  # 正規表現について
  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角ひらがな、全角カタカナ、全角漢字のみ入力可能' }
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角ひらがな、全角カタカナ、全角漢字のみ入力可能' }
  validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナのみ入力可能' }
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナのみ入力可能' }
  validates :password, format: { with: /\A[a-z0-9]+\z/i, message: '半角英数' }
end
