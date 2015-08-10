class Product < ActiveRecord::Base
  belongs_to :business
  validates  :name,       presence: true
  validates  :unit_price, presence: true
end
