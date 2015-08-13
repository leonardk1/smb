require 'rails_helper'

RSpec.describe Role, :type => :model do
  before do
    @role = create(:role)
  end

  subject { @role }
  it { should be_valid }
  attributes_present_or_not?(["name"])

  describe "relationship to contacts" do
    before do
      @contact1 = create(:contact, role_id: @role.id)
      @contact2 = create(:contact, role_id: @role.id)
    end

    it "has many contacts" do
      expect(@role.contacts.count).to be > 1
    end
  end

  describe "an invalid Role" do
    before do
      @invalid_role = Role.create(attributes_for(:invalid_role))
    end

    it "shoud not save" do
      expect(@invalid_role).to_not be_valid
    end

    specify "error message when no name is specified" do
      expect(@invalid_role.errors.full_messages).to include("Name can't be blank")
    end
  end

  describe "uniqueness of the name" do
   before do
      @role = Role.create(attributes_for(:role,
       name: "admin"))
      @non_unique_role = Role.create(attributes_for(:role,
       name: "admin"))
    end

    it "shoud not save" do
      expect(@non_unique_role).to_not be_valid
    end
  end
end
