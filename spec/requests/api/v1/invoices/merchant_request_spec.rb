require 'rails_helper'

describe 'Invoice merchant' do
  it 'can return the merchant of an invoice' do
    merchant = create(:merchant, id: 1)
    invoice = create(:invoice, merchant: merchant)

    get "/api/v1/invoices/#{invoice.id}/merchant"

    expect(response).to be_success

    returned_merchant = JSON.parse(response.body)

    expect(returned_merchant.class).to eq(Hash)
    expect(returned_merchant["id"]).to eq(merchant.id)
  end
end