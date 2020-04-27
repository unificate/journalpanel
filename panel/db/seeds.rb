# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   Microservice.create(name:'example', address:'example.com/micromange')

Microservice.create(name:'customer_info', address:'localhost:3001/micromanage')

Microservice.create(name:'contacts', address:'localhost:3002/micromanage')

# Default admin user - this should be changed when first setting up the app
User.create(username:'admin', password:'password', role:'Admin')
