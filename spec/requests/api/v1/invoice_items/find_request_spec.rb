require 'rails_helper'

describe "Invoice Items params returns single record" do
  it "can find invoice items by id" do
    invoice_items = create_list(:invoice_item, 3)

    get "/api/v1/invoice_items/find?id=#{invoice_items.first.id}"

    expect(response).to be_success

    invoice_item = JSON.parse(response.body)

    expect(invoice_item["id"]).to eq(invoice_items.first.id)
  end

  it "can find invoice items by quantity" do
    invoice_items = create_list(:invoice_item, 3)

    get "/api/v1/invoice_items/find?quantity=#{invoice_items.first.quantity}"

    expect(response).to be_success

    invoice_item = JSON.parse(response.body)

    expect(invoice_item["id"]).to eq(invoice_items.first.id)
  end

  it "can find invoice items by unit price" do
    invoice_items = create_list(:invoice_item, 3)
    unit_price= "1.20"
    get "/api/v1/invoice_items/find?unit_price=#{unit_price}"

    expect(response).to be_success

    invoice_item = JSON.parse(response.body)

    expect(invoice_item["id"]).to eq(invoice_items.first.id)
  end

  it "can find invoice items by created_at" do
    invoice_items = create_list(:invoice_item, 3)

    get "/api/v1/invoice_items/find?created_at=#{invoice_items.first.created_at}"

    expect(response).to be_success

    invoice_item = JSON.parse(response.body)

    expect(invoice_item["id"]).to eq(invoice_items.first.id)
  end

  it "can find invoice items by updated_at" do
    invoice_items = create_list(:invoice_item, 3)

    get "/api/v1/invoice_items/find?updated_at=#{invoice_items.first.updated_at}"

    expect(response).to be_success

    invoice_item = JSON.parse(response.body)

    expect(invoice_item["id"]).to eq(invoice_items.first.id)
  end
end

describe "Invoice Item params can find all records" do
  it "can find all invoice items by id" do
    ii1 = InvoiceItem.create(quantity: 1, unit_price: 1200, created_at: "2017-05-01 18:06:59", updated_at: "2017-05-01 18:06:59")
    ii2 = InvoiceItem.create(quantity: 1, unit_price: 1200, created_at: "2017-05-01 18:06:59", updated_at: "2017-05-01 18:06:59")

    get "/api/v1/invoice_items/find_all?id=#{ii1.id}"

    expect(response).to be_success

    invoice_item = JSON.parse(response.body)

    expect(invoice_item.first["id"]).to eq(ii1.id)

  end

  it "can find all invoice items by quantity" do
    ii1 = InvoiceItem.create(quantity: 1, unit_price: 1200, created_at: "2017-05-01 18:06:59", updated_at: "2017-05-01 18:06:59")
    ii2 = InvoiceItem.create(quantity: 1, unit_price: 1200, created_at: "2017-05-01 18:06:59", updated_at: "2017-05-01 18:06:59")
    ii3 = InvoiceItem.create(quantity: 3, unit_price: 1200, created_at: "2017-05-01 18:06:59", updated_at: "2017-05-01 18:06:59")

    get "/api/v1/invoice_items/find_all?quantity=#{ii1.quantity}"

    expect(response).to be_success

    invoice_items = JSON.parse(response.body)

    expect(invoice_items.count).to eq(2)

  end

  it "can find all invoice items by unit price" do
    ii1 = InvoiceItem.create(quantity: 1, unit_price: 1200, created_at: "2017-05-01 18:06:59", updated_at: "2017-05-01 18:06:59")
    ii2 = InvoiceItem.create(quantity: 1, unit_price: 1200, created_at: "2017-05-01 18:06:59", updated_at: "2017-05-01 18:06:59")
    ii3 = InvoiceItem.create(quantity: 1, unit_price: 1400, created_at: "2017-05-01 18:06:59", updated_at: "2017-05-01 18:06:59")
    unit_price = "12.00"
    get "/api/v1/invoice_items/find_all?unit_price=#{unit_price}"

    expect(response).to be_success

    invoice_items = JSON.parse(response.body)

    expect(invoice_items.count).to eq(2)

  end

  it "can find all invoice items by created at" do
    ii1 = InvoiceItem.create(quantity: 1, unit_price: 1200, created_at: "2017-05-01 18:06:59", updated_at: "2017-05-01 18:06:59")
    ii2 = InvoiceItem.create(quantity: 1, unit_price: 1200, created_at: "2017-05-01 18:06:59", updated_at: "2017-05-01 18:06:59")
    ii3 = InvoiceItem.create(quantity: 1, unit_price: 1200, created_at: "2017-05-03 18:06:59", updated_at: "2017-05-01 18:06:59")

    get "/api/v1/invoice_items/find_all?created_at=#{ii1.created_at}"

    expect(response).to be_success

    invoice_items = JSON.parse(response.body)

    expect(invoice_items.count).to eq(2)

  end

  it "can find all invoice items by updated_at" do
    ii1 = InvoiceItem.create(quantity: 1, unit_price: 1200, created_at: "2017-05-01 18:06:59", updated_at: "2017-05-01 18:06:59")
    ii2 = InvoiceItem.create(quantity: 1, unit_price: 1200, created_at: "2017-05-01 18:06:59", updated_at: "2017-05-01 18:06:59")
    ii3 = InvoiceItem.create(quantity: 1, unit_price: 1200, created_at: "2017-05-01 18:06:59", updated_at: "2017-05-03 18:06:59")

    get "/api/v1/invoice_items/find_all?updated_at=#{ii1.updated_at}"

    expect(response).to be_success

    invoice_items = JSON.parse(response.body)

    expect(invoice_items.count).to eq(2)

  end
end