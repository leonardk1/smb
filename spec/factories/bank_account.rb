FactoryGirl.define do  
  factory :bank_account do
    name "Furaha Software Company"    
    location "CRDB, Holland House Branch"
    number "02J1022744022"
    kind "USD"
    business

    factory :invalid_bank_account do
      name nil    
      location nil
      number nil
      kind nil
      business_id nil
    end    
  end
end