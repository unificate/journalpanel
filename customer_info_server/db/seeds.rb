# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do
    Customer.create({
        first: Faker::Name.first_name,
        last: Faker::Name.last_name,
        email: Faker::Internet.email,
    })
end

20.times do
    Item.create({
        name: Faker::Dessert.variety
    })
end
