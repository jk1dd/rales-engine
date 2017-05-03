require 'rails_helper'

describe "Invoice customer" do
  it "can find the customer for an invoice" do
    customer = create(:customer, id: 1)
    invoice = create(:invoice, customer: customer)

    get "/api/v1/invoices/#{invoice.id}/customer"

    expect(response).to be_success

    returned_customer = JSON.parse(response.body)

    expect(returned_customer.count).to eq(1)
    expect(returned_customer.first["id"]).to eq(customer.id)
  end
end