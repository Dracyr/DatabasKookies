class Ingredient < ActiveRecord::Base
  has_many :products, through: :product_ingredients
  has_many :product_ingredients

  validates :name, presence: true
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def deliver_ingredient(ingredient_params)
    update({
      quantity: self.quantity + ingredient_params[:last_delivered_quantity].to_i  * 1000,
      last_delivered_quantity: ingredient_params[:last_delivered_quantity].to_i * 1000,
      last_delivered: DateTime.current
    })
  end

  def deplete(quantity)
    update(quantity: self.quantity - quantity)
  end
end
