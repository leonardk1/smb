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
end
