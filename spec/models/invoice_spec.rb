require 'rails_helper'

RSpec.describe Invoice, :type => :model do
  before do
    @invoice = create(:invoice)
  end

  subject { @invoice }
  it { should be_valid }
  check_for_attributes(["order_id"])
end
