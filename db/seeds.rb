Product.create(code: 'GR1', name: 'Green Tea', price: 3.11, quantity: 5)
Product.create(code: 'SR1', name: 'Strawberries', price: 5.00, quantity: 5)
Product.create(code: 'CF1', name: 'Coffee', price: 11.23, quantity: 5)

User.create(email: 'example@example.com', password: 'Password1234$', password_confirmation: 'Password1234$')

puts 'Seed data successfully created!'
