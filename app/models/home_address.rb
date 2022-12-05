class HomeAddress < ApplicationRecord
  belongs_to :purchase

  # validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  # validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  # validates :municiparities, presence: true
  # validates :address, presence: true
  # varidates :phone_number, presence: true
  # varidates :purchase,  presence: true
end
