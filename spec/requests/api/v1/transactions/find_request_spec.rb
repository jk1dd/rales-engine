require 'rails_helper'

describe 'Transaction params returns single record' do
  it 'can find transaction by id' do
    transactions = create_list(:transaction, 3)

    get "/api/v1/transactions/find?id=#{transactions.first.id}"

    expect(response).to be_success

    transaction = JSON.parse(response.body)

    expect(transaction["id"]).to eq(transactions.first.id)
  end

  it 'can find transaction by credit_card' do
    transactions = create_list(:transaction, 3)

    get "/api/v1/transactions/find?credit_card_number=#{transactions.first.credit_card_number}"

    expect(response).to be_success

    transaction = JSON.parse(response.body)

    expect(transaction["id"]).to eq(transactions.first.id)
  end

  it 'can find transaction by result' do
    transactions = create_list(:transaction, 3)

    get "/api/v1/transactions/find?result=#{transactions.first.result}"

    expect(response).to be_success

    transaction = JSON.parse(response.body)

    expect(transaction["result"]).to eq(transactions.first.result)
  end

  it 'can find transaction by created_at' do
    transactions = create_list(:transaction, 3)

    get "/api/v1/transactions/find?created_at=#{transactions.first.created_at}"

    expect(response).to be_success

    transaction = JSON.parse(response.body)

    expect(transaction["id"]).to eq(transactions.first.id)
  end

  it 'can find transaction by updated_at' do
    transactions = create_list(:transaction, 3)

    get "/api/v1/transactions/find?updated_at=#{transactions.first.updated_at}"

    expect(response).to be_success

    transaction = JSON.parse(response.body)

    expect(transaction["id"]).to eq(transactions.first.id)
  end
end

describe "Transaction params will find all records" do
  it "can find all transactions by id" do
    transactions = create_list(:transaction, 3)

    get "/api/v1/transactions/find_all?id=#{transactions.first.id}"

    expect(response).to be_success

    transaction = JSON.parse(response.body)

    expect(transaction.first["id"]).to eq(transactions.first.id)
  end

  it "can find all transactions by credit card_number" do
    transactions = create_list(:transaction, 3)

    get "/api/v1/transactions/find_all?credit_card_number=#{transactions.first.credit_card_number}"

    expect(response).to be_success

    transaction = JSON.parse(response.body)

    expect(transaction.first["id"]).to eq(transactions.first.id)
  end

  it "can find all transactions by credit card exp" do
    transactions = create_list(:transaction, 3)

    get "/api/v1/transactions/find_all?credit_card_expiration_date=#{transactions.first.credit_card_expiration_date}"

    expect(response).to be_success

    transaction = JSON.parse(response.body)

    expect(transaction.first["id"]).to eq(transactions.first.id)
  end

  it "can find all transactions by result" do
    transactions = create_list(:transaction, 3)

    get "/api/v1/transactions/find_all?result=#{transactions.first.result}"

    expect(response).to be_success

    transaction = JSON.parse(response.body)

    expect(transaction.first["result"]).to eq(transactions.first.result)
  end

  it "can find all transactions by created_at" do
    transactions = create_list(:transaction, 3)

    get "/api/v1/transactions/find_all?created_at=#{transactions.first.created_at}"

    expect(response).to be_success

    transaction = JSON.parse(response.body)

    expect(transaction.first["id"]).to eq(transactions.first.id)
  end

  it "can find all transactions by updated_at" do
    transactions = create_list(:transaction, 3)

    get "/api/v1/transactions/find_all?updated_at=#{transactions.first.updated_at}"

    expect(response).to be_success

    transaction = JSON.parse(response.body)

    expect(transaction.first["id"]).to eq(transactions.first.id)
  end
end
