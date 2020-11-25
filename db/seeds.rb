# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Coupon.destroy_all





5.times do
  user = User.create!(
    name: Faker::Name.name
    )
  coupon = Coupon.create!(
    name: Faker::Dessert.flavor,
    validity: Faker::Date.forward(days: 10),
    offer: Faker::Coffee.blend_name,
    address: Faker::Address.street_address,
    shop_name: Faker::Coffee.variety,
    shop_info: Faker::Lorem.sentence(word_count: 7),
    contacts: Faker::PhoneNumber.phone_number,
    user: user
    )
end
