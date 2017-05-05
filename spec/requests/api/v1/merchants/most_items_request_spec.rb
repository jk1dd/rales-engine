require 'rails_helper'

describe "Merchant most items" do
  it "returns list of merchants ranked by most items sold" do
    merchant_1, merchant_2 = create_list(:merchant, 2)
    invoice_1 = create(:invoice, merchant: merchant_1)
    invoice_2 = create(:invoice, merchant: merchant_2)
    transaction_1 = create(:transaction, invoice: invoice_1, result: 'success')
    transaction_2 = create(:transaction, invoice: invoice_2, result: 'success')
    item1, item2, item3 = create_list(:item, 3)
    ii1 = create(:invoice_item, invoice: invoice_1, item: item1, quantity: 300)
    ii2 = create(:invoice_item, invoice: invoice_2, item: item2, quantity: 200)
    ii3 = create(:invoice_item, invoice: invoice_2, item: item3, quantity: 102)

    get '/api/v1/merchants/most_items?quantity=2'

    expect(response).to be_success

    merchants = JSON.parse(response.body)

    expect(merchants.count).to eq(2)

    expect(merchants.first["id"]).to eq(merchant_2.id)
  end
end