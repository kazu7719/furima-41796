FactoryBot.define do
  factory :order_address do
    postal_code { Faker::Number.number(digits: 3).to_s + '-' + Faker::Number.number(digits: 4).to_s }
    prefecture_id { Faker::Number.between(from: 2, to: 47) }
    municipalities { Faker::Address.city }
    street_address { Faker::Address.street_address }
    building_name { Faker::Address.secondary_address }
    number { Faker::Number.leading_zero_number(digits: [10, 11].sample) }
    token { "tok_#{Faker::Alphanumeric.alphanumeric(number: 24)}" }
  end
end
