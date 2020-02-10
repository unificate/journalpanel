# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Microservice.create(name:'customer_info',address:'localhost:3001/grabber')

Microservice.create(name:'contacts',address:'localhost:3002/grabber')

# Default admin user - ideally this would be changed when first setting up the app
User.create(username:'admin', password:'password', role:'Admin')
