require 'rails_helper'

RSpec.describe Product, :type => :model do
  before do
    @product = create(:product)
  end

  @attribute_array = ["name", "unit_price"]

  subject { @product }

  it { should be_valid }

  #testing product validity
  @attribute_array.each { |product_attribute|
    #ensures that all the the required attributes are present
    context "when #{product_attribute} is present" do
      has_attribute(product_attribute)
    end

    #checks for absence of any of the required attributes
    context "when #{product_attribute} is not present" do
      requires_attribute(product_attribute)
    end
  }   
end
