class AddOrderDeliveryToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :order_delivery_id, :integer, index: true
    add_foreign_key :orders, :order_deliveries
  end
end
