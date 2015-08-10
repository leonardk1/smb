require 'rails_helper'

RSpec.describe OrderProduct, :type => :model do
  before do
    @order_product = create(:order_product)
  end

  @attribute_array = ["order_id", "product_id", "quantity"]

  subject { @order_product }

  it { should be_valid }

  check_for_attributes(@attribute_array)

  describe "invalid order_product" do
    before do
      @invalid_order_product = OrderProduct.create(attributes_for(:invalid_order_product))
      @invalid_order_product_2 = OrderProduct.create(attributes_for(:invalid_order_product, quantity: 0))
      @invalid_order_product_3 = OrderProduct.create(attributes_for(:invalid_order_product, quantity: -1))
    end

    it "shoud not save" do
      expect(@invalid_order_product).to_not be_valid 
    end

    specify "error message when no order is specified" do
      expect(@invalid_order_product.errors.full_messages).to include("Order can't be blank")
    end

    specify "error message when no product is specified" do
      expect(@invalid_order_product.errors.full_messages).to include("Product can't be blank")
    end

    specify "error message when no quantity is specified" do
      expect(@invalid_order_product.errors.full_messages).to include("Quantity can't be blank")
    end

    specify "error message when quantity is not a number" do
      expect(@invalid_order_product.errors.full_messages).to include("Quantity is not a number")
    end

    specify "error message when quantity is 0" do
      expect(@invalid_order_product_2.errors.full_messages).to include("Quantity must be greater than 0")
    end

    specify "error message when quantity is negative" do
      expect(@invalid_order_product_3.errors.full_messages).to include("Quantity must be greater than 0")
    end
  end
end
