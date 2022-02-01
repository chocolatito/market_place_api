# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.delete_all
User.delete_all

3.times do
  user = User.create! email: Faker::Internet.email, password: 'locadex1234'
  # eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJleHAiOjE2NDM4MDMxMTR9.xA7c52BBVgwrj0lsV0wWcHkkTluhLC_FedNQfVm4Y3g
  # curl --header "Authorization=eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJleHAiOjE2NDM4MDMxMTR9.xA7c52BBVgwrj0lsV0wWcHkkTluhLC_FedNQfVm4Y3g" http://localhost:3000/api/v1/products
  puts "Created a new user: #{user.email}"

  2.times do
    product = Product.create!(
      title: Faker::Commerce.product_name,
      price: rand(1.0..100.0),
      published: true,
      user_id: user.id
    )
    puts "Created a brand new product: #{product.title}"
  end
end