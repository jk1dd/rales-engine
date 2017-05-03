FactoryGirl.define do
  factory :transaction do
    invoice
    credit_card_number "5555555555555555"
    credit_card_expiration_date "5555"
    result 'success'
    created_at "2017-05-01 18:54:02"
    updated_at "2017-05-01 18:54:02"
  end
end
