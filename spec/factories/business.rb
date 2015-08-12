FactoryGirl.define do  
  factory :business do
    name "Furaha Software Company"
    address "P.O.Box 913 Dar es Salaam, Tanzania"
    location "African Building Center, 3rd floor"
    voice "+255222780303"
    fax "+255222781136"
    vrn "40-003493-D"
    tin "107-031-693"

    factory :food_business do
      name "Food Supplies"
    end

    factory :electronics_business do
      name "Electronics Gen Ent"
    end

    factory :paper_business do
      name "Paper Binding Ltd"
    end

    factory :fuel_business do
      name "Shell Ltd"
    end

    factory :invalid_business do
      name nil
      location nil
    end    
  end
end