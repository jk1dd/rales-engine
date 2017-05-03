require 'rails_helper'

describe 'Merchant has invoices' do
  it "can find all invoices for a single merchant" do
    merchant = create(:merchant)
    invoice1, invoice2 = create_list(:invoice, 2, merchant: merchant)

  end
end
