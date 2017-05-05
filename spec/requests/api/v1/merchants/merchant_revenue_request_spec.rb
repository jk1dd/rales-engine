require 'rails_helper'

describe 'Merchant revenue' do
  it 'returns total revenue for single merchant' do
    merchant_1, = create(:merchant)
    invoice_1 = create(:invoice, merchant: merchant_1)
    transaction_1 = create(:transaction, invoice: invoice_1, result: 'success')
    ii1 = create(:invoice_item, invoice: invoice_1, quantity: 301)
    ii2 = create(:invoice_item, invoice: invoice_1, quantity: 21)

    get '/api/v1/merchants/1/revenue'

    expect(response).to be_success
    revenue = JSON.parse(response.body)
    expect(revenue.class).to eq(Hash)
    expect(revenue['revenue']).to eq('386.4')
  end

  it 'returns total revenue for single merchant on given date' do
    merchant_1 = create(:merchant)
    date = '2017-05-02T17:54:53.00Z'
    invoice_1 = create(:invoice, merchant: merchant_1)
    invoice_2 = create(:invoice, merchant: merchant_1, created_at: date)
    transaction_1 = create(:transaction, invoice: invoice_1, result: 'success')
    transaction_2 = create(:transaction, invoice: invoice_2, result: 'success')
    ii1 = create(:invoice_item, invoice: invoice_1, quantity: 301)
    ii2 = create(:invoice_item, invoice: invoice_2, quantity: 298)


    get "/api/v1/merchants/#{merchant_1.id}/revenue?date=#{date}"

    expect(response).to be_success

    revenue = JSON.parse(response.body)

    expect(revenue.class).to eq(Hash)
    expect(revenue['revenue']).to eq('357.6')

  end
end