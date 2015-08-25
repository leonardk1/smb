require 'rails_helper'

RSpec.describe DashboardController, :type => :controller do
  before do
    @contact = create(:contact)
    sign_in @contact
  end

  describe "Get Index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end
  end
end
