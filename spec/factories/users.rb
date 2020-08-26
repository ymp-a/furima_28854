FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.last_name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { '田中' }
    first_name            { '太郎' }
    kana_last_name        { 'タナカ' }
    kana_first_name       { 'タロウ' }
    birthdate             { 2020 / 0o2 / 0o2 }
  end
end
