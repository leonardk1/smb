class BankAccount < ActiveRecord::Base
  belongs_to :business
  validates :name, presence: true
  validates :number, presence: true, uniqueness: true
  validates :location, presence: true
  validates :kind, presence: true
  validates :business_id, presence: true
end
