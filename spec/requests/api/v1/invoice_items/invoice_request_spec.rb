require 'rails_helper'

describe 'Invoice items invoice' do
  it 'can return an invoice for an invoice item' do
    invoice = create(:invoice, id: 1)
    invoice_item = create(:invoice_item, invoice: invoice)

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

    expect(response).to be_success

    returned_invoice = JSON.parse(response.body)


    expect(returned_invoice.class).to eq(Hash)
    expect(returned_invoice["id"]).to eq(invoice.id)
  end
end
