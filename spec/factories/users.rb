FactoryBot.define do
  factory :user do
    nickname              { 'abe' }
    email                 {Faker::Internet.free_email}
    password              { '111aaa' }
    password_confirmation { password }
    surname               { 'あべ' }
    first_name            { 'しん' }
    kana_surname          { 'アベ' }
    kana_first_name       { 'シン' }
    birthday              { { 1 => 1930, 2 => 1, 3 => 2 } }
  end
end
