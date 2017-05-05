require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  context 'attributes' do
    it 'has quantity, unit_price, item_id, invoice_id, created_at, updated_at' do
      ii = create(:invoice_item)

      expect(ii).to respond_to(:quantity)
      expect(ii).to respond_to(:unit_price)
      expect(ii).to respond_to(:item_id)
      expect(ii).to respond_to(:invoice_id)
      expect(ii).to respond_to(:created_at)
      expect(ii).to respond_to(:updated_at)
    end
  end
end
