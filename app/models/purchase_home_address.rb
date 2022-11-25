class purchase_home_address
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municiparities, :address, :building_name, :phone_number, :purchase

  with_options presence: true do
    varidates :item
    varidates :user
    validates :municiparities
    validates :address
    varidates :phone_number
    varidates :purchase
    validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    # 寄付情報を保存し、変数donationに代入する
    purchase = Purchase.create(item: item, user: user)
    Home_address.create(post_code: post_code, prefecture_id: prefecture_id, municiparities: municiparities, address: address, building_name: building_name, phone_number: phone_number purchase_id: purchase.id)
  end
end