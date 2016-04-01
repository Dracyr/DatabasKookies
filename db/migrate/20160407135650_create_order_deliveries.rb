class CreateOrderDeliveries < ActiveRecord::Migration
  def change
    create_table :order_deliveries do |t|
      t.belongs_to :delivery, index: true
      t.belongs_to :order, index: true

      t.timestamps null: false
    end
    add_foreign_key :order_deliveries, :orders
    add_foreign_key :order_deliveries, :deliveries
  end
end
