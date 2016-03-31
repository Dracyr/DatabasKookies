class CreateProductIngredients < ActiveRecord::Migration
  def change
    create_table :product_ingredients do |t|
      t.belongs_to :product, index: true
      t.belongs_to :ingredient, index: true
      t.integer :quantity
    end
    add_foreign_key :product_ingredients, :products
    add_foreign_key :product_ingredients, :ingredients
  end
end
