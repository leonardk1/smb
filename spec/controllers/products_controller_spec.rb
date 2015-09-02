require 'rails_helper'

RSpec.describe ProductsController, :type => :controller do
	before do		
		@business = create(:business)
		sign_in create(:contact, business_id: @businessg)
	end

  describe "GET index" do
    it "returns http success" do
      get :index, business_id: @business.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new" do
    it "renders the new template" do
      get :new, business_id: @business.id
      expect(response).to render_template :new
    end    
  end

  describe "POST create" do
  	before do
  		session[:business_id] = "#{@business.id}"
  	end
    context "Success" do
      before do      	
        post :create, product: { name: "Laptop", unit_price: 200.0, description: "New Product", business_id: @business.id}, business_id: session[:business_id]
      end

      it "redirects to the home path" do
        expect(response).to redirect_to business_products_path(session[:business_id])
      end

      it "generates a success message" do
        expect(flash[:success]).to eq("Product, Successfully Added")
      end

      specify "The new Product Gets Added to the Database" do
        expect{ post :create, product: attributes_for(:product), business_id: session[:business_id] }.to change(Product,:count).by(1)
      end
    end

    context "Failure" do
      before do
        post :create, product: { name: "", unit_price: " "}, business_id: session[:business_id]
      end

      it "renders the new product form " do
        expect(response).to render_template :new
      end

      it "generates a failure message" do
        expect(flash[:error]).to eq("Sorry, Unable to add the new product because\n          Name can't be blank and Unit price can't be blank")
      end

      specify "There are no changes to the Product table" do
        expect{ post :create, product: { name: "", unit_price: " "}, business_id: session[:business_id] }.to change(Product,:count).by(0)
      end
    end
  end

end
