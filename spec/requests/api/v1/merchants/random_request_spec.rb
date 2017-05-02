require 'rails_helper'

describe 'Merchant random' do
  it 'can return a random merchant' do
    create_list(:merchant, 3)

    get "/api/v1/merchants/random.json"

    expect(response).to be_success

    merchant = JSON.parse(response.body)

    expect(merchant.class).to be(Hash)
    expect(merchant.count).to be(2)
  end
end
