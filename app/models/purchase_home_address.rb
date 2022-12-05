class PurchaseHomeAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municiparities, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :municiparities
    validates :address
    validates :phone_number, format: /\A\d{10,11}\z/
    validates :post_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :token, presence: true
  end

  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    HomeAddress.create(post_code: post_code, prefecture_id: prefecture_id, municiparities: municiparities, address: address,
                       purchase: purchase, building_name: building_name, phone_number: phone_number)
  end
end
