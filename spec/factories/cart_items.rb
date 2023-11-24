FactoryBot.define do
  factory :cart_item do
    association :cart
    association :product
    quantity { Faker::Number.positive }
  end
end
