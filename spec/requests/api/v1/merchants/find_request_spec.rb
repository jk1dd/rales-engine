require 'rails_helper'

describe 'Merchant params returns single record' do
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

    get "/api/v1/merchants/find?name=#{merchants.first.name.upcase}"

    expect(response).to be_success

    merchant = JSON.parse(response.body)

    expect(merchant["name"]).to eq(merchants.first.name)

  end

  it "can find a merchant by created_at" do
    merchants = create_list(:merchant, 3)

    get "/api/v1/merchants/find?created_at=#{merchants.first.created_at}"

    expect(response).to be_success

    merchant = JSON.parse(response.body)

    expect(merchant["id"]).to eq(merchants.first.id)
  end

  it "can find a merchant by updated_at" do
    merchant1 = Merchant.create(name: "merchant1", created_at: "2017-05-01 18:06:59", updated_at: "2017-05-02 18:06:59")
    Merchant.create(name: "merchant2", created_at: "2017-05-03 18:06:59", updated_at: "2017-05-04 18:06:59")

    get "/api/v1/merchants/find?updated_at=#{merchant1.updated_at}"

    expect(response).to be_success

    merchant = JSON.parse(response.body)

    expect(merchant["id"]).to eq(merchant1.id)
  end
end

describe "Merchant params will find all records" do
  it "can find all merchants by id" do
    merchants = create_list(:merchant, 3)

    get "/api/v1/merchants/find_all?id=#{merchants.first.id}"

    expect(response).to be_success

    merchant = JSON.parse(response.body)

    expect(merchant.first["id"]).to eq(merchants.first.id)
  end

  it "can find all merchants by name" do
    merchant1 = Merchant.create(name: "merchant1", created_at: "2017-05-01 18:06:59", updated_at: "2017-05-02 18:06:59")
    merchant2 = Merchant.create(name: "merchant1", created_at: "2017-05-03 18:06:59", updated_at: "2017-05-04 18:06:59")
    merchant3 = Merchant.create(name: "merchant3", created_at: "2017-05-03 18:06:59", updated_at: "2017-05-04 18:06:59")

    get "/api/v1/merchants/find_all?name=#{merchant1.name}"

    expect(response).to be_success

    merchants = JSON.parse(response.body)

    expect(merchants.count).to eq(2)

    get "/api/v1/merchants/find_all?name=#{merchant1.name.upcase}"

    expect(response).to be_success

    merchants = JSON.parse(response.body)

    expect(merchants.count).to eq(2)
  end

  it "can find all merchants by created_at" do
    merchant1 = Merchant.create(name: "merchant1", created_at: "2017-05-01 18:06:59", updated_at: "2017-05-02 18:06:59")
    merchant2 = Merchant.create(name: "merchant1", created_at: "2017-05-03 18:06:59", updated_at: "2017-05-04 18:06:59")
    merchant3 = Merchant.create(name: "merchant3", created_at: "2017-05-03 18:06:59", updated_at: "2017-05-04 18:06:59")

    get "/api/v1/merchants/find_all?created_at=#{merchant2.created_at}"

    expect(response).to be_success

    merchants = JSON.parse(response.body)

    expect(merchants.count).to eq(2)
  end

  it "can find all merchants by updated_at" do
    merchant1 = Merchant.create(name: "merchant1", created_at: "2017-05-01 18:06:59", updated_at: "2017-05-02 18:06:59")
    merchant2 = Merchant.create(name: "merchant1", created_at: "2017-05-03 18:06:59", updated_at: "2017-05-04 18:06:59")
    merchant3 = Merchant.create(name: "merchant3", created_at: "2017-05-03 18:06:59", updated_at: "2017-05-04 18:06:59")

    get "/api/v1/merchants/find_all?updated_at=#{merchant2.updated_at}"

    expect(response).to be_success

    merchants = JSON.parse(response.body)

    expect(merchants.count).to eq(2)
  end
end
