FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    last_name { Faker::Name.last_name }
    first_name { Faker::Name.first_name }
    kana_last_name { 'ヤマダ' }
    kana_first_name { 'タロウ' }
    birthday { Faker::Date.birthday(min_age: 5, max_age: 95) }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
  end
end
