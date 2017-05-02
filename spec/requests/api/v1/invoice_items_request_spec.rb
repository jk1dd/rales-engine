require 'rails_helper'

describe "Invoice Items API" do
  it "sends a list of invoice items" do
    create_list(:invoice_item, 3)

    get '/api/v1/invoice_items'

    expect(response).to be_success

    invoice_items = JSON.parse(response.body)
    invoice_item = invoice_items.first

    expect(invoice_items.count).to eq(3)
    expect(invoice_item).to have_key("id")
    expect(invoice_item).to have_key("quantity")
    expect(invoice_item).to have_key("unit_price")
  end

  it "can get one invoice item by id" do
    id = create(:invoice_item).id

    get "/api/v1/invoice_items/#{id}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["id"]).to eq(id)
  end
end