class Product < ActiveRecord::Base
  has_many :product_ingredients
  has_many :ingredients, through: :product_ingredients
  has_many :pallets
  has_many :production_blocks

  accepts_nested_attributes_for :product_ingredients, allow_destroy: true

  validates :name, presence: true

  delegate :to_s, to: :name
end

