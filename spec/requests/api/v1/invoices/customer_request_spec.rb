require 'rails_helper'

describe "Invoice customer" do
  it "can find the customer for an invoice" do
    customer = create(:customer, id: 1)
    invoice = create(:invoice, customer: customer)

    get "/api/v1/invoices/#{invoice.id}/customer"

    expect(response).to be_success

    returned_customer = JSON.parse(response.body)

    expect(returned_customer.class).to eq(Hash)
    expect(returned_customer["id"]).to eq(customer.id)
  end
end