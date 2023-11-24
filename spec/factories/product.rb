FactoryBot.define do
  factory :product do
    code { Faker::Alphanumeric.alpha(number: 3).upcase }
    name { Faker::Commerce.product_name }
    price { Faker::Commerce.price(range: 2.0..100.0) }
    quantity { Faker::Number.positive }
  end
end
