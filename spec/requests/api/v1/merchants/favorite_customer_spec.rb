require 'rails_helper'

describe "Merchant favorite customer" do
  it "can return customer with most successfull transactions for given merchant" do
    merchant_1, = create(:merchant)
    customer1, customer2 = create_list(:customer, 2)
    invoice_1 = create(:invoice, merchant: merchant_1, customer: customer1)
    invoice_2 = create(:invoice, merchant: merchant_1, customer: customer2)
    transaction_1 = create(:transaction, invoice: invoice_1, result: 'success')
    transaction_2 = create(:transaction, invoice: invoice_2, result: 'success')
    ii1 = create(:invoice_item, invoice: invoice_1, quantity: 301)
    ii2 = create(:invoice_item, invoice: invoice_2, quantity: 298)

    get '/api/v1/merchants/1/favorite_customer'

    expect(response).to be_success

    customer = JSON.parse(response.body)

    expect(customer.class).to eq(Hash)
    expect(customer["id"]).to eq(customer1.id)
  end
end

