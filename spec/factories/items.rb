FactoryBot.define do
  factory :item do
    name              { Faker::Name.name }
    item_descrption   { Faker::Lorem.sentence }
    category_id       { 2 }
    status_id         { 2 }
    cost_bearer_id    { 2 }
    consignor_id      { 2 }
    delivery_date_id  { 2 }
    price             { 300 }
    user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/hukuroudrill.jpeg'), filename: 'hukuroudrill.jpeg')
    end
  end
end
