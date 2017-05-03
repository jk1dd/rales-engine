require 'rails_helper'

describe 'Item invoice items' do
  it 'can find all invoice items of an item' do
    item = create(:item, id: 1)
    ii1, ii2 = create_list(:invoice_item, 2, item: item)

    get "/api/v1/items/#{item.id}/invoice_items"

    expect(response).to be_success

    iis = JSON.parse(response.body)

    expect(iis.count).to eq(2)
    expect(iis.first["id"]).to eq(ii1.id)
  end
end
