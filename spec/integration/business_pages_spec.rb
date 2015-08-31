require 'rails_helper'

describe 'Business Pages' do
  subject { page }

  describe 'Registration' do
    before do
      @role = create(:role)
      visit new_contact_registration_path
      fill_in "contact[email]",    with: "#{Faker::Internet.email}"
      fill_in "contact[firstname]", with: "#{Faker::Name.first_name}"
      fill_in "contact[lastname]", with: "#{Faker::Name.last_name}"
      fill_in "contact[role_id]", with: "#{@role.id}"
      fill_in "contact[password]", with: "Precise@32"
      fill_in "contact[password_confirmation]", with: "Precise@32"
      click_button "Sign up"
    end

    it { should have_content("Welcome! You have signed up successfully")}

    describe "submitting business details" do
      context "Success" do
        before do
          @business_name = Faker::Internet.email
          fill_in "business[name]",    with: "#{@business_name}"
          fill_in "business[location]", with: "#{Faker::Address.street_name}
            #{Faker::Address.street_address}"
          fill_in "business[address]", with: "#{Faker::Address.postcode}"
          fill_in "business[vrn]", with: "TX-987-987"
          fill_in "business[tin]", with: "1009T"
          fill_in "business[voice]", with: "+255788988776"
          fill_in "business[fax]", with: "+255788988776"
          click_button "Add Business"
        end

        it { should have_content("Business, Successfully Added")}
        it { should have_content("Details for #{@business_name}")}
      end

      context "Failure" do
        before do
          fill_in "business[name]",    with: ""
          fill_in "business[location]", with: ""
          fill_in "business[address]", with: ""
          fill_in "business[vrn]", with: ""
          fill_in "business[tin]", with: ""
          fill_in "business[voice]", with: ""
          fill_in "business[fax]", with: ""
          click_button "Add Business"
        end

        it { should have_content(" Sorry, Unable to Register the Business because Name can't be blank and Location can't be blank")}
      end
    end
  end
end