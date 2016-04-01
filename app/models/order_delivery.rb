class OrderDelivery < ActiveRecord::Base
  belongs_to :order
  belongs_to :delivery

  has_many :pallets
end
