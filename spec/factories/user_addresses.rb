FactoryBot.define do
  factory :user_address do
    token { '090900dfghjhgfdfgh' }
    user_id { 1 }
    item_id { 1 }
    postalcode        { '111-1111' }
    prefecture_id     { 2 }
    city              { Faker::Address.city }
    address           { '青山1-1-1' }
    building_name     { '青山ビル1F' }
    phone_number      { Faker::Number.leading_zero_number(digits: 11) }
  end
end
