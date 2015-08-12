FactoryGirl.define do
  factory :contact do
  	firstname { Faker::Name.first_name }
  	lastname { Faker::Name.last_name }
  	mobile { Faker::PhoneNumber.cell_phone }
    email { Faker::Internet.email }
    role
    password "password"
    password_confirmation "password"

    factory :invalid_contact do
    	firstname nil
    	lastname nil
    	mobile nil
    	role_id nil
    	password nil
    	password_confirmation nil
    end  
  end
end