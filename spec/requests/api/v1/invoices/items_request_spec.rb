require 'rails_helper'

describe "Invoices items" do
  it "can find all items for a single invoice" do
    invoice = create(:invoice, id: 1)
    item1 = create(:item, id: 1)
    item2 = create(:item, id: 2)
    ii1 = create(:invoice_item, invoice: invoice, item: item1)
    ii2 = create(:invoice_item, invoice: invoice, item: item2)

    get "/api/v1/invoices/#{invoice.id}/items"

    expect(response).to be_success

    items = JSON.parse(response.body)

    expect(items.count).to eq(2)
    expect(items.first["id"]).to eq(item1.id)
  end
end