require 'rails_helper'

describe 'Merchant most revenue' do
  it 'returns merchants ranked by most revenue' do
    merchant_1, merchant_2 = create_list(:merchant, 2)
    invoice_1 = create(:invoice, merchant: merchant_1)
    invoice_2 = create(:invoice, merchant: merchant_2)
    transaction_1 = create(:transaction, invoice: invoice_1, result: 'success')
    transaction_2 = create(:transaction, invoice: invoice_2, result: 'success')
    ii1 = create(:invoice_item, invoice: invoice_1, quantity: 1)
    ii2 = create(:invoice_item, invoice: invoice_2, quantity: 193933)
    ii3 = create(:invoice_item, invoice: invoice_2, quantity: 9843)

    get '/api/v1/merchants/most_revenue?quantity=2'

    expect(response).to be_success

    merchants = JSON.parse(response.body)

    expect(merchants.count).to eq(2)
    expect(merchants.first['id']).to eq(merchant_2.id)
  end
end