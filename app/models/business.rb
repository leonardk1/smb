class Business < ActiveRecord::Base
  has_many :products
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "customer_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "service_provider_id",
                                   dependent:   :destroy
  has_many :service_providers, through: :active_relationships, source: :service_provider
  has_many :customers, through: :passive_relationships, source: :customer
  has_many :bank_accounts
  has_many :mobile_money_accounts
  validates  :name,     presence: true
  validates  :location, presence: true

  # adds a provider
  def add_service_provider(other_business)
    active_relationships.create(service_provider_id: other_business.id)
  end

  # removes a provider
  def remove_service_provider(other_business)
    active_relationships.find_by(service_provider_id: other_business.id).destroy
  end

  # Returns true if the current business is a customer of  the other business.
  def is_a_customer?(other_business)
    service_providers.include?(other_business)
  end
end
