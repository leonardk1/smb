FactoryGirl.define do
  factory :role do
    name "Admin"

    factory :invalid_role do
      name nil
    end
  end  
end