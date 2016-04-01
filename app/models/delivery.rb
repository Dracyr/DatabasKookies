class Delivery < ActiveRecord::Base
  has_many :order_deliveries
  has_many :orders, through: :order_deliveries
  has_many :pallets, through: :order_deliveries
end
