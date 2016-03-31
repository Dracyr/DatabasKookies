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
    {name: "Flour", quantity: "450 g"},
    {name: "Butter", quantity: "450 g"},
    {name: "Icing sugar", quantity: "190 g"},
    {name: "Roasted, chopped nuts", quantity: "225 g"}
  ]}, {name: "Nut cookie", ingredients: [
    {name: "Fine-ground nuts", quantity: "750 g"},
    {name: "Ground, roasted nuts", quantity: "625 g"},
    {name: "Bread crumbs", quantity: "125 g"},
    {name: "Sugar", quantity: "375 g"},
    {name: "Egg whites", quantity: "3,5 dl"},
    {name: "Chocolate", quantity: "50 g"}
  ]}, {name: "Amneris", ingredients: [
    {name: "Marzipan", quantity: "750 g"},
    {name: "Butter", quantity: "250 g"},
    {name: "Eggs", quantity: "250 g"},
    {name: "Potato starch", quantity: "25 g"},
    {name: "Wheat flour", quantity: "25 g"}
  ]}, {name: "Tango", ingredients: [
    {name: "Butter", quantity: "200 g"},
    {name: "Sugar", quantity: "250 g"},
    {name: "Flour", quantity: "300 g"},
    {name: "Sodium bicarbonate", quantity: "4 g"},
    {name: "Vanilla", quantity: "2 g"}
  ]}, {name: "Almond delight", ingredients: [
    {name: "Butter", quantity: "400 g"},
    {name: "Sugar", quantity: "270 g"},
    {name: "Chopped almonds", quantity: "279 g"},
    {name: "Flour", quantity: "400 g"},
    {name: "Cinnamon", quantity: "10 g"}
  ]}, {name: "Berliner", ingredients: [
    {name: "Flour", quantity: "350 g"},
    {name: "Butter", quantity: "250 g"},
    {name: "Icing sugar", quantity: "100 g"},
    {name: "Eggs", quantity: "50 g"},
    {name: "Vanilla sugar", quantity: "5 g"},
    {name: "Chocolate", quantity: "50 g"}
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
