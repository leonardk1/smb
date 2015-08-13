FactoryGirl.define do  
  factory :order do        
    business

    factory :invalid_order do      
      business_id nil
    end    
  end
end