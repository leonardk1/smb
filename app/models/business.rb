class Business < ActiveRecord::Base
	has_many :products
  validates  :name,     presence: true
  validates  :location, presence: true
end
