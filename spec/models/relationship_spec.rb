require 'rails_helper'

RSpec.describe Relationship, :type => :model do
  before do
    @business1 = create(:business, name: "Top Enterprises")
    @business2 = create(:business, name: "Fast Food")
    @relationship = Relationship.new(customer_id: @business1.id, service_provider_id: @business2.id)
  end

  specify "validity" do
    expect(@relationship.valid?).to eq(true)
  end

  specify "is invalid without customer_id" do
    @relationship.customer_id = nil
    expect(@relationship.valid?).to eq(false)
  end

  specify "is invalid without service_provider_id" do
    @relationship.service_provider_id = nil
    expect(@relationship.valid?).to eq(false)
  end
end
