require 'rails_helper'

describe "Customer random" do
  it "can return random customer" do
    create_list(:customer, 3)

    get "/api/v1/customers/random.json"

    expect(response).to be_success

    customer = JSON.parse(response.body)

    expect(customer.class).to be(Hash)
  end
end