require 'rails_helper'

RSpec.describe BusinessController, :type => :controller do
  before do
    @contact = create(:contact)
    sign_in @contact
  end

  describe "GET new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    context "Success" do
      before do
        post :create, business: attributes_for(:business)
      end

      it "redirects to the home path" do
        expect(response).to redirect_to root_path
      end

      it "generates a success message" do
        expect(flash[:success]).to eq("Business, Successfully Added")
      end

      specify "The new Business Gets Added to the Database" do
        expect{ post :create, business: attributes_for(:business) }.to change(Business,:count).by(1)
      end
    end

    context "Failure" do
      before do
        post :create, business: { name: ""}
      end

      it "redirects to the home path" do
        expect(response).to render_template :new
      end

      it "generates a success message" do
        expect(flash[:error]).to eq("Sorry, Unable to Register the Business
          because Name can't be blank and Location can't be blank")
      end

      specify "There are no changes to the business table" do
        expect{ post :create, business: { name: ""} }.to change(Business,:count).by(0)
      end
    end
  end
end
