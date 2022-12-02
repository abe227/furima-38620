class Purchase < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :home_address

  # varidates :item, presence: true
  # varidates :user, presence: true
end
