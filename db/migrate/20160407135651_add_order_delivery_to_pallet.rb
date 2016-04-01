class AddOrderDeliveryToPallet < ActiveRecord::Migration
  def change
    add_column :pallets, :order_delivery_id, :integer, index: true
    add_foreign_key :pallets, :order_deliveries

    remove_column :pallets, :order_products_id, :integer, index: true
  end
end
