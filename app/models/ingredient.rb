class Ingredient < ActiveRecord::Base
  has_many :products, through: :product_ingredients
  has_many :product_ingredients

  def deliver_ingredient(ingredient_params)
    update({
      quantity: self.quantity + ingredient_params[:last_delivered_quantity].to_i,
      last_delivered_quantity: ingredient_params[:last_delivered_quantity],
      last_delivered: DateTime.current
    })
  end
end
