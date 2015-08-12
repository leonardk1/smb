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
      @food_business = create(:food_business)
      @electronics_business = create(:electronics_business)
    end

    specify "is initially not a customer to any business" do
      expect(@food_business.is_a_customer?(@electronics_business)).to eq(false)
    end

    specify "can add a service provider" do
      @food_business.add_service_provider(@electronics_business)
      expect(@food_business.active_relationships.where(customer_id: @food_business.id,
        service_provider_id: @electronics_business.id).empty?).to eq(false)
    end

    specify "can remove a service provider" do
      @food_business.add_service_provider(@electronics_business)
      @food_business.remove_service_provider(@electronics_business)
      expect(@food_business.active_relationships.where(customer_id: @food_business.id,
        service_provider_id: @electronics_business.id).empty?).to eq(true)
    end
  end

  describe "customers and service providers" do
    before do
      Business.delete_all
      @food_business = create(:food_business)
      @electronics_business = create(:electronics_business)
      @fuel_business = create(:fuel_business)
      @paper_business = create(:paper_business)
    end

    specify "can have one or more service providers" do
      @food_business.add_service_provider(@electronics_business)
      @food_business.add_service_provider(@fuel_business)
      expect(@food_business.service_providers.count).to be > 1
    end

    specify "can have one or more customers" do
      @food_business.add_service_provider(@paper_business)
      @electronics_business.add_service_provider(@paper_business)
      expect(@paper_business.customers.count).to be > 1
    end

    context "Service provider and Customer at the same time" do
      before do
        @paper_business.add_service_provider(@fuel_business)
        @fuel_business.add_service_provider(@electronics_business)
      end
      specify "being a customer" do
        expect(@fuel_business.customers.include?(@paper_business)).to eq(true)
      end

      specify "being a service provider" do
        expect(@fuel_business.service_providers.include?(@electronics_business)).to eq(true)
      end
    end

    context "two business can be both service providers and customers to each other" do
      before do
        @paper_business.add_service_provider(@fuel_business)
        @fuel_business.add_service_provider(@paper_business)
      end

      specify "mutual customer-service provider relationship" do
        expect(@paper_business.is_a_customer?(@fuel_business)).to eq(true)
        expect(@fuel_business.is_a_customer?(@paper_business)).to eq(true)
      end
    end
  end
end
