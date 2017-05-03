require 'rails_helper'

describe "Invoice transactions" do
  it "can find all transactions for a single invoice" do
    invoice = create(:invoice, id: 1)
    transaction1, transaction2 = create_list(:transaction, 2, invoice: invoice)

    get "/api/v1/invoices/#{invoice.id}/transactions"

    expect(response).to be_success

    transactions = JSON.parse(response.body)

    expect(transactions.count).to eq(2)
    expect(transactions.first["id"]).to eq(transaction1.id)
  end
end
