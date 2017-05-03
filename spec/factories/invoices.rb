FactoryGirl.define do
  factory :invoice do
    merchant
    status "shipped"
    created_at "2017-05-01 17:54:53"
    updated_at "2017-05-01 17:54:53"
  end
end
