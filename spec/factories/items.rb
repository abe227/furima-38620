FactoryBot.define do
  factory :item do
    title                 { 'aaa' }
    explanation           { 'aaa' }
    price                 { '11111' }
    category_id           { '3' }
    situation_id          { '2' }
    cost_id               { '2' }
    days_to_ship_id       { '2' }
    prefecture_id         { '3' }
    
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
    
  end
end
