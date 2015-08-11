require 'rails_helper'

describe Business do
  before do
    @business = create(:business)
  end
  subject { @business }

  it { should respond_to(:name) }
  it { should respond_to(:location) }
  it { should respond_to(:voice) }
  it { should respond_to(:fax) }
  it { should respond_to(:vrn) }
  it { should respond_to(:tin) }

  describe "invalid business" do
    before do
      @invalid_business = Business.create(attributes_for(:invalid_business))
    end

    it "shoud not save" do
      expect(@invalid_business).to_not be_valid 
    end

    specify "error message when no name is specified" do
      expect(@invalid_business.errors.full_messages).to include("Name can't be blank")
    end

    specify "error message when no location is speicified" do
      expect(@invalid_business.errors.full_messages).to include("Location can't be blank")
    end
  end

  describe "association to product" do
    before do
      @product = create(:product, name: "Fridge", business_id: @business.id)
      @second_product = create(:product, name: "Printer", business_id: @business.id)
    end

    it "has many products" do
      expect(@business.products.count).to be > 1
    end
  end

  describe "adding and removing service providers" do
    before do
      Business.delete_all
      @business3 = create(:business, name: "Food Supplies")
      @business4 = create(:business, name: "Electronics Gen Ent")
    end

    specify "is initially not a customer to any business" do
      expect(@business3.is_a_customer?("Electronics Gen Ent")).to eq(false)
    end

    specify "can add a service provider" do
      @business3.add_service_provider(@business4)
      expect(@business3.active_relationships.where(customer_id: @business3.id, service_provider_id: @business4.id).empty?).to eq(false)
    end

    specify "can remove a service provider" do
      @business3.add_service_provider(@business4)
      @business3.remove_service_provider(@business4)
      expect(@business3.active_relationships.where(customer_id: @business3.id, service_provider_id: @business4.id).empty?).to eq(true)
    end
  end

  describe "customers and service providers" do
    before do
      Business.delete_all
      @business5 = create(:business, name: "Food Supplies")
      @business6 = create(:business, name: "Electronics Gen Ent")
      @business7 = create(:business, name: "Paper Binding Ltd")
      @business8 = create(:business, name: "Shell Ltd")
    end

    specify "can have one or more service providers" do
      @business5.add_service_provider(@business6)
      @business5.add_service_provider(@business7)
      expect(@business5.service_providers.count).to be > 1
    end

    specify "can have one or more customers" do
      @business5.add_service_provider(@business8)
      @business6.add_service_provider(@business8)
      expect(@business8.customers.count).to be > 1
    end

    context "Service provider and Customer at the same time" do
      before do
        @business8.add_service_provider(@business7)
        @business7.add_service_provider(@business6)
      end
      specify "being a customer" do
        expect(@business7.customers.include?(@business8)).to eq(true)
      end

      specify "being a service provider" do
        expect(@business7.service_providers.include?(@business6)).to eq(true)
      end
    end

    context "two business can be both service providers and customers to each other" do
      before do
        @business8.add_service_provider(@business7)
        @business7.add_service_provider(@business8)
      end

      specify "mutual customer-service provider relationship" do
        expect(@business8.is_a_customer?(@business7)).to eq(true)
        expect(@business7.is_a_customer?(@business8)).to eq(true)
      end
    end
  end
end
