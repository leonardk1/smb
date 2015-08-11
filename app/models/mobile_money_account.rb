class MobileMoneyAccount < ActiveRecord::Base
  belongs_to :business
  validates :number, presence: true, uniqueness: true
  validates :name, presence: true
  validates :business_id, presence: true
end
