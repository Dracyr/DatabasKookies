class ProductionBlock < ActiveRecord::Base
  belongs_to :product

  scope :in_range, -> (time) { where("end_at > :time AND start_at < :time", time: time) }

  def blocked_pallets
    Pallet.where(product: product, created_at: start_at..end_at)
  end
end
