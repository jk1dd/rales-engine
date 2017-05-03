FactoryGirl.define do
  factory :merchant do
    sequence :name do |n|
      "Merchy McMerchant #{n}"
    end
    sequence :created_at do |n|
      "2017-05-0#{n} 18:06:59"
    end
    sequence :updated_at do |n|
      "2017-05-0#{n} 18:06:59"
    end
  end
end
