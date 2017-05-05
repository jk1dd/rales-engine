require 'rails_helper'

describe 'Customers favorite merchant' do
  it 'returns the merchant with whom the customer has the most successful transactions' do
    customer = create(:customer)
    great_merch = create(:merchant)
    ok_merch = create(:merchant)

    great_merch_invoices = create_list(:invoice, 33, merchant: great_merch, customer: customer)
    ok_merch_invoices = create_list(:invoice, 5, merchant: ok_merch, customer: customer)

    great_merch_invoices.each do |i|
      create(:transaction, invoice: i, result: 'success')
    end

    ok_merch_invoices.each do |i|
      create(:transaction, invoice: i, result: 'failed')
    end

    ok_merch_invoices.each do |i|
      create(:transaction, invoice: i, result: 'success')
    end

    get "/api/v1/customers/#{customer.id}/favorite_merchant"

    expect(response).to be_success

    merchant = JSON.parse(response.body)

    expect(merchant['id']).to eq(great_merch.id)
  end
end
