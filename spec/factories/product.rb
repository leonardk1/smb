FactoryGirl.define do  
  factory :product do
    name "laptop"
    unit_price 600000
    description "Dell Mini"
    business

    factory :invalid_product do
      name nil
      unit_price nil
    end    
  end
end