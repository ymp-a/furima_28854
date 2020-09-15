FactoryBot.define do
  factory :address do
    postalcode        { '111-1111' }
    prefecture_id     { 2 }
    city              { Faker::Address.city }
    address           { '青山1-1-1' }
    building_name     { '青山ビル1F' }
    phone_number      { Faker::Number.leading_zero_number(digits: 11) }
    association :deal
  end
end
