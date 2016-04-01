class ChangeLastDeliveredQuantityToInteger < ActiveRecord::Migration
  def change
    remove_column :ingredients, :last_delivered_quantity, :string
    add_column :ingredients, :last_delivered_quantity, :float, default: 0, null: false

    change_column :ingredients, :quantity, :float, default: 0, null: false
  end
end
