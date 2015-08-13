FactoryGirl.define do  
  factory :invoice do
    order

    factory :invalid_invoice do
      order_id nil
    end    
  end
end