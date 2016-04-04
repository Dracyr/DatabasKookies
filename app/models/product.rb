class Product < ActiveRecord::Base
  has_many :product_ingredients
  has_many :ingredients, through: :product_ingredients

  accepts_nested_attributes_for :product_ingredients, allow_destroy: true
end

