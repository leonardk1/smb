require 'rails_helper'

RSpec.describe Contact, :type => :model do
  before do
    @contact = create(:contact)
  end

  subject { @contact }
  it { should be_valid }
  attributes_present_or_not?(["firstname", "lastname", "email", "role_id"])
  it { should respond_to(:encrypted_password) }
  it { should respond_to(:reset_password_token) }
  it { should respond_to(:reset_password_sent_at) }
  it { should respond_to(:remember_created_at) }
  it { should respond_to(:current_sign_in_at) }
  it { should respond_to(:current_sign_in_ip) }
  it { should respond_to(:last_sign_in_ip) }
  it { should respond_to(:confirmation_token) }
  it { should respond_to(:confirmed_at) }
  it { should respond_to(:confirmation_sent_at) }

  describe "invalid Contact" do
    before do
      @invalid_contact = Contact.create(attributes_for(:invalid_contact))
    end

    it "shoud not save" do
      expect(@invalid_contact).to_not be_valid
    end

    specify "error message when no firstname is specified" do
      expect(@invalid_contact.errors.full_messages).to include("Firstname can't be blank")
    end

    specify "error message when no lastname is specified" do
      expect(@invalid_contact.errors.full_messages).to include("Lastname can't be blank")
    end

    specify "error message when no role is specified" do
      expect(@invalid_contact.errors.full_messages).to include("Role can't be blank")
    end

    specify "error message when no password is specified" do
      expect(@invalid_contact.errors.full_messages).to include("Password can't be blank")
    end
  end

  describe "saving without a password confirmation" do
     before do
      @contact = Contact.create(attributes_for(:contact, password_confirmation: nil))
    end

    it "shoud not save" do
      expect(@contact).to_not be_valid
    end
  end

  describe "uniqueness of the email address" do
   before do
      @contact = Contact.create(attributes_for(:contact,
       email: "user@example.com"))
      @non_unique_contact = Contact.create(attributes_for(:contact,
       email: "user@example.com"))
    end

    it "shoud not save" do
      expect(@non_unique_contact).to_not be_valid
    end
  end
end
