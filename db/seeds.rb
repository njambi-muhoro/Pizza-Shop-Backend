# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "🌱 Seeding messages..."

# Create 10 restaurants
10.times do
    restaurant = Restaurant.create(
      name: Faker::Restaurant.name,
      
      address: Faker::Address.full_address
    )
  
    # Add 5 random pizzas to each restaurant
    5.times do
      pizza = Pizza.create(
        name: Faker::Food.dish,
        ingredients: Faker::Address.full_address
      )
  
      RestaurantPizza.create(
        restaurant: restaurant,
        pizza: pizza,
        price: Faker::Number.between(from: 5, to: 20)
      )
    end
  end

  puts "✅ Done seeding!"