require 'rails_helper'

RSpec.describe MobileMoneyAccount, :type => :model do
  before do
  	@mobile_money_account = create(:mobile_money_account)
  end

  subject { @mobile_money_account }
  it { should be_valid }

  @attributes_array = ["name", "number", "business_id"]
  attributes_present_or_not?(@attributes_array)

  describe "invalid mobile mobile money account" do
    before do
      @invalid_mobile_money_account = MobileMoneyAccount.create(attributes_for(:invalid_mobile_money_account))
    end

    it "shoud not save" do
      expect(@invalid_mobile_money_account).to_not be_valid 
    end

    specify "error message when no name is specified" do
      expect(@invalid_mobile_money_account.errors.full_messages).to include("Name can't be blank")
    end    

    specify "error message when no number is speicified" do
      expect(@invalid_mobile_money_account.errors.full_messages).to include("Number can't be blank")
    end
  end

  describe "uniqueness of account number" do
  	before do
      @mobile_money_account = MobileMoneyAccount.create(attributes_for(:mobile_money_account,
      	number: "+255788767668"))
      @non_unique_mobile_money_account = MobileMoneyAccount.create(attributes_for(:mobile_money_account,
      	number: "+255788767668"))
    end

    it "shoud not save" do
      expect(@non_unique_mobile_money_account).to_not be_valid 
    end
  end
end
