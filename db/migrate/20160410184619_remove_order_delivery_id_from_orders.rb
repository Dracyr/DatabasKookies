class RemoveOrderDeliveryIdFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :order_delivery_id, :integer
  end
end
