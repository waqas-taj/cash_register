FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: Devise.password_length.min) }
    password_confirmation { password }
  end
end
