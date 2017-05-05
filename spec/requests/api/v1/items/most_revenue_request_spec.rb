require 'rails_helper'

describe 'Items ranked by most revenue' do
  it 'ranks items by most revenue' do
    item_1, item_2 = create_list(:item, 2)
    invoice = create(:invoice)
    transaction = create(:transaction, invoice: invoice)
    ii1 = create(:invoice_item, invoice: invoice, item: item_1, quantity: 44455)
    ii2 = create(:invoice_item, invoice: invoice, item: item_2, quantity: 4)

    get '/api/v1/items/most_revenue?quantity=2'

    expect(response).to be_success

    items = JSON.parse(response.body)

    expect(items.count).to eq(2)
    expect(items.first["id"]).to eq(ii1.id)
  end
end
