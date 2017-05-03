require 'rails_helper'

describe "Invoice invoice items" do
  it "can find all invoice items for a single merchant" do
    invoice = create(:invoice, id: 1)
    item = create(:item, id: 1)
    ii1, ii2 = create_list(:invoice_item, 2, invoice: invoice, item: item)

    get "/api/v1/invoices/#{invoice.id}/invoice_items"

    expect(response).to be_success

    invoice_items = JSON.parse(response.body)

    expect(invoice_items.count).to eq(2)
    expect(invoice_items.first["id"]).to eq(ii1.id)
  end
end
