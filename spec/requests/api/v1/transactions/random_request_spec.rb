require "rails_helper"

describe 'Returns a random Transaction' do
  it "returns a random transaction" do
    create_list(:transaction, 3)

    get "/api/v1/transactions/random.json"

    expect(response).to be_success

    transaction = JSON.parse(response.body)

    expect(transaction.class).to be(Hash)
  end
end
