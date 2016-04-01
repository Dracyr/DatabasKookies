class Order < ActiveRecord::Base
  belongs_to :customer

  has_many :order_deliveries
  has_many :delivered_pallets, through: :order_deliveries, source: :pallets
  has_many :deliveries, through: :order_deliveries

  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  accepts_nested_attributes_for :order_products, allow_destroy: true

  validates :customer, presence: true

  def delivered?
    delivered_pallets_count = delivered_pallets.count
    if delivered_pallets_count == pallet_count
      :yes
    elsif delivered_pallets_count > 0
      :partial
    else
      :no
    end
  end

  def pallet_count
    # order_products.group(:product_id).sum(:quantity)
    order_products.sum(:quantity)
  end
end
