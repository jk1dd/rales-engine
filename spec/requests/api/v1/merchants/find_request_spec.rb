require 'rails_helper'

describe 'Merchant find by params' do
  it 'can find a merchant by id' do
    merchants = create_list(:merchant, 3)

    get "/api/v1/merchants/find?id=#{merchants.first.id}"

    expect(response).to be_success

    merchant = JSON.parse(response.body)

    expect(merchant["id"]).to eq(merchants.first.id)
  end

  it 'can find a merchant by name' do
    merchants = create_list(:merchant, 3)

    get "/api/v1/merchants/find?name=#{merchants.first.name}"

    expect(response).to be_success

    merchant = JSON.parse(response.body)

    expect(merchant["name"]).to eq(merchants.first.name)
  end
end
