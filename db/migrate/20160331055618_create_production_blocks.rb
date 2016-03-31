class CreateProductionBlocks < ActiveRecord::Migration
  def change
    create_table :production_blocks do |t|
      t.belongs_to :product, index: true
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps null: false
    end
    add_foreign_key :production_blocks, :products
  end
end
