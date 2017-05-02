FactoryGirl.define do
  factory :invoice do
    customer_id 1
    merchant_id 2
    status "shipped"
    created_at "2017-05-01 17:54:53"
    updated_at "2017-05-01 17:54:53"
  end
end
