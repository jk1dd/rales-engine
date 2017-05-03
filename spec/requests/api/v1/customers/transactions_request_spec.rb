require 'rails_helper'

describe "Customer transactions" do
  it "can find all invoices for a given customer" do
    customer = create(:customer, id: 1)
    invoice = create(:invoice, customer: customer)
    transaction1, transaction2 = create_list(:transaction, 2, invoice: invoice)

    get "/api/v1/customers/#{customer.id}/transactions"

    expect(response).to be_success

    transactions = JSON.parse(response.body)

    expect(transactions.count).to eq(2)
    expect(transactions.first["id"]).to eq(transaction1.id)
  end
end