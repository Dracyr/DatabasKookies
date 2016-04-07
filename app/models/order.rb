class Order < ActiveRecord::Base
  belongs_to :customer

  has_many :pallets, through: :order_products
  has_many :products, through: :order_products
  has_many :order_products, dependent: :destroy

  accepts_nested_attributes_for :order_products, allow_destroy: true

  validates :customer, presence: true
end
