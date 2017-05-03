FactoryGirl.define do
  factory :invoice_item do
    item
    invoice
    quantity 1
    unit_price 120
    created_at "2017-05-01 19:21:26"
    updated_at "2017-05-01 19:21:26"
  end
end
