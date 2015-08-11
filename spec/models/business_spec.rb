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

  describe "association to bank account" do
    before do
      @bank_account = create(:bank_account, number: "09J2090988988", business_id: @business.id)
      @bank_account2 = create(:bank_account, business_id: @business.id)
    end

    it "has many bank accounts" do
      expect(@business.bank_accounts.count).to be > 1
    end
  end

  describe "association to mobile money accounts" do
    before do
      @mobile_money_account = create(:mobile_money_account, number: "+254756909098", business_id: @business.id)
      @mobile_moeny_account2 = create(:mobile_money_account, business_id: @business.id)
    end

    it "has many mobile money accounts" do
      expect(@business.mobile_money_accounts.count).to be > 1
    end
  end
end
