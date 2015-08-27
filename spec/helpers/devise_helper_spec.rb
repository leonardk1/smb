require 'spec_helper' 

RSpec.describe DeviseHelper, type: :helper do
  let(:resource_name) { (:contact) }
  let(:devise_mapping){ (Devise.mappings[:contact]) }

  context 'no error messages' do
    let(:resource) { (Contact.new) }
    it '#devise_error_messages!' do
      expect(devise_error_messages!).to eq("")
    end
  end

  context 'with error messages' do
    let(:resource) { (Contact.create) } 
    it '#devise_error_messages!' do
      expect(devise_error_messages!).to_not eq("")
    end
  end
end