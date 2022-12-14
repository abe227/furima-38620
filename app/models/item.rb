class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :cost
  belongs_to :prefecture
  belongs_to :days_to_ship
  belongs_to :user
  has_one    :purchase

  validates :image, presence: true
  validates :title, presence: true
  validates :explanation, presence: true
  validates :price, presence: true,numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id, presence: true, numericality: { other_than: 1, message: "を入力してください" }
  validates :situation_id, presence: true, numericality: { other_than: 1, message: "を入力してください" }
  validates :cost_id, presence: true, numericality: { other_than: 1, message: "を入力してください" }
  validates :days_to_ship_id, presence: true, numericality: { other_than: 1, message: "を入力してください" }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "を入力してください" }
end
