require 'rails_helper'

describe 'Invoice items item' do
  it 'can return the item for an invoice item' do
    item = create(:item, id: 1)
    invoice_item = create(:invoice_item, item: item)

    get "/api/v1/invoice_items/#{invoice_item.id}/item"

    expect(response).to be_success

    returned_item = JSON.parse(response.body)

    expect(returned_item.class).to eq(Hash)
    expect(returned_item["id"]).to eq(item.id)
  end
end
