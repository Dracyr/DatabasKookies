class Customer < ActiveRecord::Base
  has_many :orders

  validates :name, presence: true
  validates :address, presence: true

  delegate :to_s, to: :name
end
