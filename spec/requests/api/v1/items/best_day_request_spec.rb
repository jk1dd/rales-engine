require 'rails_helper'

describe 'Item best day' do
  it 'returns the day with the most sales of a given item, based on invoice' do
    best_day = '2012-03-27T03:55:22.000Z'
    regular_day = '2012-03-26T23:57:10.000Z'

    item = create(:item)

    best_invoice = create(:invoice, created_at: best_day)
    ok_invoice = create(:invoice, created_at: regular_day)

    ii1, ii2 = create_list(:invoice_item,
                           2,
                           item: item,
                           invoice: best_invoice,
                           quantity: 503_203_493)

    ii3, ii4 = create_list(:invoice_item,
                           2, item: item,
                           invoice: ok_invoice,
                           quantity: 4)

    get "/api/v1/items/#{item.id}/best_day"

    expect(response).to be_success

    day = JSON.parse(response.body)

    expect(day['best_day']).to eq(best_day)
  end
end
