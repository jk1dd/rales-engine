require 'rails_helper'

describe "Transaction invoice" do
  it "can find the invoice for a single transaction" do
    invoice = create(:invoice, id: 1)
    transaction = create(:transaction, invoice: invoice)

    get "/api/v1/transactions/#{transaction.id}/invoice"

    expect(response).to be_success

    returned_transaction = JSON.parse(response.body)

    expect(returned_transaction.class).to eq(Hash)
    expect(returned_transaction["id"]).to eq(transaction.id)
  end
end