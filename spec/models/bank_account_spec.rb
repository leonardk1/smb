require 'rails_helper'

RSpec.describe BankAccount, :type => :model do
  before do
  	@bank_account = create(:bank_account)
  end

  subject { @bank_account }
  it { should be_valid }

  @attributes_array = ["name", "location", "number", "kind", "business_id"]

  describe "invalid mobile Bank account" do
    before do
      @invalid_bank_account = BankAccount.create(attributes_for(:invalid_bank_account))
    end

    it "shoud not save" do
      expect(@invalid_bank_account).to_not be_valid 
    end

    specify "error message when no name is specified" do
      expect(@invalid_bank_account.errors.full_messages).to include("Name can't be blank")
    end

    specify "error message when no location is specified" do
      expect(@invalid_bank_account.errors.full_messages).to include("Location can't be blank")
    end

    specify "error message when no number is specified" do
      expect(@invalid_bank_account.errors.full_messages).to include("Number can't be blank")
    end

    specify "error message when no kind is specified" do
      expect(@invalid_bank_account.errors.full_messages).to include("Kind can't be blank")
    end
  end

  describe "uniqueness of account number" do
  	before do
      @bank_account = BankAccount.create(attributes_for(:bank_account,
      	number: "09J90909090"))
      @non_unique_bank_account = BankAccount.create(attributes_for(:bank_account,
      	number: "09J90909090"))
    end

    it "shoud not save" do
      expect(@non_unique_bank_account).to_not be_valid 
    end
  end
end
