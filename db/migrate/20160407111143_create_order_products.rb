class CreateOrderProducts < ActiveRecord::Migration
  def change
    create_table :order_products do |t|
      t.belongs_to :order, index: true
      t.belongs_to :product, index: true
      t.integer :quantity, null: false
    end
    add_foreign_key :order_products, :orders
    add_foreign_key :order_products, :products
  end
end
