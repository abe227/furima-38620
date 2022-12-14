FactoryBot.define do
  factory :purchase_home_address do
    post_code { '123-4567' }
    prefecture_id { '2' }
    municiparities { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '1234567890' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
