class Pallet < ActiveRecord::Base
  belongs_to :product
  belongs_to :order_product
  has_one :order, through: :order_product

  delegate :to_s, to: :id

  def blocked?
    ProductionBlock.in_range(created_at).where(product: product).any?
  end
end
