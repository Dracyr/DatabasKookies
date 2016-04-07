class ProductIngredient < ActiveRecord::Base
  belongs_to :product
  belongs_to :ingredient

  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }

  delegate :name, to: :ingredient
end

