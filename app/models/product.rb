class Product < ActiveRecord::Base
  belongs_to :business
  has_many :order_products
  has_many :orders, through: :order_products
  validates  :name,       presence: true
  validates  :unit_price, presence: true
end
