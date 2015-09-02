require 'rails_helper'

describe 'Product Pages' do
  subject { page }

  describe 'Adding a Product' do
    before do
      login(create(:business))
    end

    describe "submitting business details" do
      context "Success" do
        before do
          click_link("Products")
          click_link("Add a New Product")
          fill_in "product[name]",    with: "Laptop"
          fill_in "product[unit_price]", with: 200
          fill_in "product[description]", with: "Dell Mini Series"          
          click_button "Add Product"
        end

        it { should have_content("Product, Successfully Added ")}
        it { should have_content("Product List")}
        it { should have_content("Laptop")}
        it { should have_content("200")}
        it { should have_content("Dell Mini Series")}
      end

      context "Failure" do
        before do
          click_link("Products")
          click_link("Add a New Product")
          fill_in "product[name]",    with: ""
          fill_in "product[unit_price]", with: ""
          fill_in "product[description]", with: ""          
          click_button "Add Product"
        end

        it { should have_content("  Sorry, Unable to add the new product because Name can't be blank and Unit price can't be blank")}
      end
    end
  end
end