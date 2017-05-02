FactoryGirl.define do
  factory :transaction do
    credit_card "5555555555555555"
    credit_card_expiration_date "5555"
    result 'success'
    created_at "2017-05-01 18:54:02"
    updated_at "2017-05-01 18:54:02"
  end
end
