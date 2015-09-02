require 'rails_helper'

RSpec.describe DashboardController, :type => :controller do
  before do
    @request.env["devise.mapping"] = Devise.mappings[:contact]
    @business = create(:business)
    @contact = create(:contact, business_id: @business.id)
    sign_in @contact
  end

  describe "Get Index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end
  end
end
