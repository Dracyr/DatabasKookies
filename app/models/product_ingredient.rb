class ProductIngredient < ActiveRecord::Base
  belongs_to :product
  belongs_to :ingredient

  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates_associated :ingredient

  delegate :name, to: :ingredient

  def deplete(product_quantity)
    ingredient.deplete(product_quantity * quantity)
  end
end

