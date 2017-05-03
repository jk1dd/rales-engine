require 'rails_helper'

describe 'Customer params returns single items' do
  it 'returns a customer by id' do
    customers = create_list(:customer, 3)

    get "/api/v1/customers/find?id=#{customers.first.id}"

    expect(response).to be_success

    customer = JSON.parse(response.body)

    expect(customer["id"]).to eq(customers.first.id)
  end

  it 'returns a customer by first_name' do
    customers = create_list(:customer, 3)

    get "/api/v1/customers/find?first_name=#{customers.first.first_name}"

    expect(response).to be_success

    customer = JSON.parse(response.body)

    expect(customer["first_name"]).to eq(customers.first.first_name)
  end

  it 'returns a customer by last_name' do
    customers = create_list(:customer, 3)

    get "/api/v1/customers/find?last_name=#{customers.first.last_name}"

    expect(response).to be_success

    customer = JSON.parse(response.body)

    expect(customer["last_name"]).to eq(customers.first.last_name)
  end

  it 'returns a customer by created_at' do
    customers = create_list(:customer, 3)

    get "/api/v1/customers/find?created_at=#{customers.first.created_at}"

    expect(response).to be_success

    customer = JSON.parse(response.body)

    expect(customer["id"]).to eq(customers.first.id)
  end

  it 'returns a customer by updated_at' do
    customers = create_list(:customer, 3)

    get "/api/v1/customers/find?updated_at=#{customers.first.updated_at}"

    expect(response).to be_success

    customer = JSON.parse(response.body)

    expect(customer["id"]).to eq(customers.first.id)
  end
end

describe "Customer params returns all items" do
  it 'returns all customers by id' do
    customers = create_list(:customer, 3)

    get "/api/v1/customers/find_all?id=#{customers.first.id}"

    expect(response).to be_success

    customer = JSON.parse(response.body)

    expect(customer.first["id"]).to eq(customers.first.id)
    expect(customer.count).to eq(1)
  end

  it 'returns all customers by first_name' do
    customers = create_list(:customer, 3)

    get "/api/v1/customers/find_all?first_name=#{customers.first.first_name}"

    expect(response).to be_success

    customer = JSON.parse(response.body)

    expect(customer.first["first_name"]).to eq(customers.first.first_name)
    expect(customer.count).to eq(3)
  end

  it 'returns all customers by last_name' do
    customers = create_list(:customer, 3)

    get "/api/v1/customers/find_all?last_name=#{customers.first.last_name}"

    expect(response).to be_success

    customer = JSON.parse(response.body)

    expect(customer.first["last_name"]).to eq(customers.first.last_name)
    expect(customer.count).to eq(3)
  end

  it 'returns all customers by created_at' do
    customers = create_list(:customer, 3)

    get "/api/v1/customers/find_all?created_at=#{customers.first.created_at}"

    expect(response).to be_success

    customer = JSON.parse(response.body)

    expect(customer.first["id"]).to eq(customers.first.id)
    expect(customer.count).to eq(3)
  end

  it 'returns all customers by updated_at' do
    customers = create_list(:customer, 3)

    get "/api/v1/customers/find_all?updated_at=#{customers.first.updated_at}"

    expect(response).to be_success

    customer = JSON.parse(response.body)

    expect(customer.first["id"]).to eq(customers.first.id)
    expect(customer.count).to eq(3)
  end
end
