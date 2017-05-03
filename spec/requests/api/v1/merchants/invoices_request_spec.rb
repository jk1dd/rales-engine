require 'rails_helper'

describe 'Merchant has invoices' do
  it "can find all invoices for a single merchant" do
    merchant = create(:merchant)
    invoice1, invoice2 = create_list(:invoice, 2, merchant: merchant)

    get "/api/v1/merchants/#{merchant.id}/invoices"

    expect(response).to be_success

    invoices = JSON.parse(response.body)

    expect(invoices.count).to eq(2)
    expect(invoices.first["id"]).to eq(invoice1.id)
  end
end
