FactoryGirl.define do  
  factory :mobile_money_account do
    name "Furaha Software Company"
    number "+255788677665"
    business

    factory :invalid_mobile_money_account do
      name nil
      number nil
      business_id nil
    end    
  end
end