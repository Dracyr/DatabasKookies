class AddProducedCountToProducts < ActiveRecord::Migration
  def change
    add_column :products, :produced_count, :integer, null: false, default: 0
  end
end
