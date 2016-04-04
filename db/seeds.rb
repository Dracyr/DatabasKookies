# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ingredients = [
  "Bread crumbs",
  "Butter",
  "Chocolate",
  "Chopped almonds",
  "Cinnamon",
  "Egg whites",
  "Eggs",
  "Flour",
  "Ground, roasted nuts",
  "Icing sugar",
  "Marzipan",
  "Fine-ground nuts",
  "Potato starch",
  "Roasted, chopped nuts",
  "Sodium bicarbonate",
  "Sugar",
  "Vanilla",
  "Vanilla sugar",
  "Wheat flour"
]

ingredients.each do |ingredient|
  Ingredient.create(name: ingredient)
end


products = [
  {name: "Nut ring", ingredients: [
    {name: "Flour", quantity: 450},
    {name: "Butter", quantity: 450},
    {name: "Icing sugar", quantity: 190},
    {name: "Roasted, chopped nuts", quantity: 225}
  ]}, {name: "Nut cookie", ingredients: [
    {name: "Fine-ground nuts", quantity: 750},
    {name: "Ground, roasted nuts", quantity: 625},
    {name: "Bread crumbs", quantity: 125},
    {name: "Sugar", quantity: 375},
    {name: "Egg whites", quantity: 350},
    {name: "Chocolate", quantity: 50}
  ]}, {name: "Amneris", ingredients: [
    {name: "Marzipan", quantity: 750},
    {name: "Butter", quantity: 250},
    {name: "Eggs", quantity: 250},
    {name: "Potato starch", quantity: 25},
    {name: "Wheat flour", quantity: 25}
  ]}, {name: "Tango", ingredients: [
    {name: "Butter", quantity: 200},
    {name: "Sugar", quantity: 250},
    {name: "Flour", quantity: 300},
    {name: "Sodium bicarbonate", quantity: 4},
    {name: "Vanilla", quantity: 2}
  ]}, {name: "Almond delight", ingredients: [
    {name: "Butter", quantity: 400},
    {name: "Sugar", quantity: 270},
    {name: "Chopped almonds", quantity: 279},
    {name: "Flour", quantity: 400},
    {name: "Cinnamon", quantity: 10}
  ]}, {name: "Berliner", ingredients: [
    {name: "Flour", quantity: 350},
    {name: "Butter", quantity: 250},
    {name: "Icing sugar", quantity: 100},
    {name: "Eggs", quantity: 50},
    {name: "Vanilla sugar", quantity: 5},
    {name: "Chocolate", quantity: 50}
  ]}
]

products.each do |product|
  ingredients = product[:ingredients].map { |i| {ingredient_id: Ingredient.find_by(name: i[:name]).id, quantity: i[:quantity]} }
  Product.create(name: product[:name], product_ingredients_attributes: ingredients)
end

customers = [
  ["Finkakor AB", "Helsingborg"],
  ["Småbröd AB", "Malmö"],
  ["Kaffebrod AB", "Landskrona"],
  ["Bjudkakor AB", "Ystad"],
  ["Kalaskakor AB", "Trelleborg"],
  ["Partykakor AB", "Kristianstad"],
  ["Gastkakor AB", "Hässleholm"],
  ["Skanekakor AB", "Perstorp"]
]

customers.each do |customer|
  Customer.create(name: customer.first, address: customer.last)
end
