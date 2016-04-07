class OrderProduct < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  has_one :pallet
  has_one :pallet_product, through: :pallet, source: :product

  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }

  delegate :name, to: :product
end

