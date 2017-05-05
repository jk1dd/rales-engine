require 'rails_helper'

RSpec.describe Invoice, type: :model do
  context 'attributes' do
    it 'has status, merchant_id, customer_id, created_at, updated_at' do
      i = create(:invoice)

      expect(i).to respond_to(:status)
      expect(i).to respond_to(:customer_id)
      expect(i).to respond_to(:merchant_id)
      expect(i).to respond_to(:created_at)
      expect(i).to respond_to(:updated_at)
    end
  end
end
