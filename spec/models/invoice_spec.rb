require 'rails_helper'

RSpec.describe Invoice, :type => :model do
  before do
    @invoice = create(:invoice)
  end

  subject { @invoice }
  it { should be_valid }
  attributes_present_or_not?(["order_id"])
end
