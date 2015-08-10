require 'rails_helper'

RSpec.describe Order, :type => :model do
  before do
    @order = create(:order)
  end

  subject { @order }
  it { should be_valid }
  check_for_attributes(["business_id"])

  describe "products" do
    before do
      @product1 = create(:product, name: "Shoes")
      @product2 = create(:product, name: "Television")
      @order_product = create(:order_product, order_id: @order.id, product_id: @product1.id, quantity: 2)
      @order_product2 = create(:order_product, order_id: @order.id, product_id: @product2.id, quantity: 2)
    end

    it "has many products" do
      expect(@order.products.count).to be > 1
    end
  end

  describe "order_product deletion" do
    before do
      @order_product = create(:order_product, order_id: @order.id)
      @order.destroy
    end

    specify "deletes the dependant order_product" do
      expect(OrderProduct.where(order_id: @order.id)).to eq([])
    end
  end
end
