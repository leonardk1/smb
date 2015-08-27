require 'rails_helper'

describe 'Authentication and Registration' do
  subject { page }

  describe "Sign up page" do
    before do
      visit new_contact_registration_path
    end

    it { should have_content('Sign up')}
    it { should have_content('Email:')}
    it { should have_content('FirstName:')}
    it { should have_content('LastName:')}
    it { should have_content('Role:')}
    it { should have_content('Password:')}
    it { should have_content('Password Confirmation:')}
    it { should have_link('Log in')}
  end
  
  describe 'Registration' do
    context 'Successful Registration' do
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
    end

    context 'Non-Successfull Registration' do
      before do
        @role = create(:role)
        visit new_contact_registration_path
        fill_in "contact[email]",    with: ""
        fill_in "contact[firstname]", with: ""
        fill_in "contact[lastname]", with: ""
        fill_in "contact[role_id]", with: ""
        fill_in "contact[password]", with: ""
        fill_in "contact[password_confirmation]", with: ""
        click_button "Sign up"
      end

      it { should have_content("Email can't be blank")}
      it { should have_content("Password can't be blank")}
      it { should have_content("Role can't be blank")}
      it { should have_content("Firstname can't be blank")}
      it { should have_content("Lastname can't be blank")}
    end
  end
end