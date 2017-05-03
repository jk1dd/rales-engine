require 'rails_helper'

describe 'Merchant items' do
  it 'finds all items for a single merchant' do
    merchant = create(:merchant)
    item1, item2, item3 = create_list(:item, 3, merchant: merchant)

    get "/api/v1/merchants/#{merchant.id}/items"

    expect(response).to be_success

    items = JSON.parse(response.body)

    expect(items.count).to eq(3)
    expect(items.first["id"]).to eq(item1.id)
  end
end
