class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :customer, index: true
      t.datetime :delivered_at

      t.timestamps null: false
    end
    add_foreign_key :orders, :customers
  end
end
