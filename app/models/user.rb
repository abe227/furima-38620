class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :email, presence: true
  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  validates :surname, format: { with: VALID_NAME_REGEX }
  validates :first_name, format: { with: VALID_NAME_REGEX }
  validates :kana_surname, presence: true, format: /\A[ァ-ヶー－]+\z/
  validates :kana_first_name, presence: true, format: /\A[ァ-ヶー－]+\z/
  validates :birthday, presence: true

  has_many :items
end
