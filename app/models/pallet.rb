class Pallet < ActiveRecord::Base
  include Filterable

  belongs_to :product
  belongs_to :order_product
  has_one :order, through: :order_product

  delegate :to_s, to: :id

  scope :product_id, -> (product_id) { where(product_id: product_id) }
  scope :created_at, -> (date_range) {
    where(created_at: date_range.first.beginning_of_day..date_range.last.end_of_day)
  }

  def self.blocked(blocked)
    if blocked
      joins("INNER JOIN production_blocks ON pallets.product_id = production_blocks.product_id")
      .where("production_blocks.end_at > pallets.created_at")
      .where("production_blocks.start_at < pallets.created_at")
    else
      all
    end
  end

  def blocked?
    ProductionBlock.in_range(created_at).where(product: product).any?
  end
end
