FactoryGirl.define do  
  factory :order_product do
    order
    product
    quantity 2

    factory :invalid_order_product do
      order_id nil
      product_id nil
      quantity nil
    end    
  end
end