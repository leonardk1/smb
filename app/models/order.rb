class Order < ActiveRecord::Base
  has_one :invoice
  has_many :order_products, dependent: :delete_all
  has_many :products, through: :order_products
  belongs_to :business
  validates :business_id, presence: true
end
