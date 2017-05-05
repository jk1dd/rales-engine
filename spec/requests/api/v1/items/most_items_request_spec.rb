require 'rails_helper'

describe 'Items ranked by number sold' do
  it 'should rank items by total number sold' do
    item_1, item_2 = create_list(:item, 2)
    invoice = create(:invoice)
    transaction = create(:transaction, invoice: invoice)
    ii1 = create(:invoice_item, invoice: invoice, item: item_1, quantity: 44455)
    ii2 = create(:invoice_item, invoice: invoice, item: item_2, quantity: 4)

    get '/api/v1/items/most_items?quantity=2'

    expect(response).to be_success

    items = JSON.parse(response.body)

    expect(items.count).to eq(2)
    expect(items.first["id"]).to eq(ii1.id)
  end
end
