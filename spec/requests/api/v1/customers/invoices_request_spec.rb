require 'rails_helper'

describe "Customer invoices" do
  it "can find all invoices for a given customer" do
    customer = create(:customer, id: 1)
    invoice1, invoice2 = create_list(:invoice, 2, customer: customer)

    get "/api/v1/customers/#{customer.id}/invoices"

    expect(response).to be_success

    invoices = JSON.parse(response.body)

    expect(invoices.count).to eq(2)
    expect(invoices.first["id"]).to eq(invoice1.id)
  end
end