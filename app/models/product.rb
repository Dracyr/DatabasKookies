class Product < ActiveRecord::Base
  has_many :product_ingredients
  has_many :ingredients, through: :product_ingredients
  has_many :pallets
  has_many :production_blocks

  accepts_nested_attributes_for :product_ingredients, allow_destroy: true

  validates :name, presence: true
  validates_associated :product_ingredients

  delegate :to_s, to: :name

  def produce(product_quantity = 1)
    quantity = product_quantity * 5400 # 15 cookies/bag, 10 bags/box, 36 boxes/pallet
    Product.transaction do
      product_ingredients.each do |pi|
        pi.deplete(quantity)
      end
      update(produced_count: self.produced_count + 1)
    end
  end
end

