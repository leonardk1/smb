class Relationship < ActiveRecord::Base
	belongs_to :customer, class_name: "Business"
  belongs_to :service_provider, class_name: "Business"
  validates :customer_id, presence: true
  validates :service_provider_id, presence: true
end
