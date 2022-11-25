class CreateHomeAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :home_addresses do |t|
      t.string     :post_code,   null: false
      t.integer    :prefecture_id,   null: false
      t.string     :municiparities,    null:false
      t.string     :address,    null:false
      t.string     :buildeing_name
      t.string     :phone_number,   null:false
      t.references :purchase,     null:false, foreign_key: true
      t.timestamps
    end
  end
end
