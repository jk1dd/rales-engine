require 'rails_helper'

describe "Invoice random" do
  it "can return random invoice" do
    create_list(:invoice, 3)

    get "/api/v1/invoices/random.json"

    expect(response).to be_success

    invoice = JSON.parse(response.body)

    expect(invoice.class).to be(Hash)
  end
end