json.array!(@ingredients) do |ingredient|
  json.extract! ingredient, :id, :name, :quantity, :last_delivered, :last_delivered_quantity
  json.url ingredient_url(ingredient, format: :json)
end
