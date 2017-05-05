require 'rails_helper'

describe "Merchant revenue for date" do
  it "returns total revenue for all merchants on given date" do
    merchant_1, merchant_2 = create_list(:merchant, 2)
    invoice_1 = create(:invoice, merchant: merchant_1)
    invoice_2 = create(:invoice, merchant: merchant_2)
    transaction_1 = create(:transaction, invoice: invoice_1, result: 'success')
    transaction_2 = create(:transaction, invoice: invoice_2, result: 'success')
    item1, item2, item3 = create_list(:item, 3)
    ii1 = create(:invoice_item, invoice: invoice_1, item: item1, quantity: 300)
    ii2 = create(:invoice_item, invoice: invoice_2, item: item2, quantity: 200)
    ii3 = create(:invoice_item, invoice: invoice_2, item: item3, quantity: 102)
    date = '2017-05-01 17:54:53'

    get "/api/v1/merchants/revenue?date=#{date}"

    expect(response).to be_success

    revenue = JSON.parse(response.body)

    expect(revenue.class).to eq(Hash)

    expect(revenue["total_revenue"]).to eq("722.4")
  end
end