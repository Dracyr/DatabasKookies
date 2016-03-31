class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :quantity, default: 0, null: false
      t.string :last_delivered
      t.string :last_delivered_quantity, default: 0, null: false

      t.timestamps null: false
    end
  end
end
