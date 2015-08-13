class Business < ActiveRecord::Base
  has_many :products
  has_many :bank_accounts
  has_many :mobile_money_accounts
  validates  :name,     presence: true
  validates  :location, presence: true
end
