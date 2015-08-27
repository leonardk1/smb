require "rails_helper"

describe "The DashBoard Page" do
  subject { page }
  before do
    login
    visit root_path
  end
  it { should have_content('Dashboard')}
  it { should have_content('Reports')}
  it { should have_content('Products')}
  it { should have_content('Orders')}
  it { should have_content('Invoices')}
  it { should have_content('Customers')}
end