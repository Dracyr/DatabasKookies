class CreatePallets < ActiveRecord::Migration
  def change
    create_table :pallets do |t|
      t.string :status
      t.belongs_to :product, index: true
      t.belongs_to :order, index: true

      t.timestamps null: false
    end
    add_foreign_key :pallets, :products
    add_foreign_key :pallets, :orders
  end
end
