class ChangePalletToUseOrderProduct < ActiveRecord::Migration
  def change
    add_column :pallets, :order_products_id, :integer
    remove_column :pallets, :order_id, :integer
  end
end
