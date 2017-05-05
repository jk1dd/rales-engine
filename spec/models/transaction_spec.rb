require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context 'attributes' do
    it 'has credit_card_number, credit_card_expiration_date, result, invoice_id, created_at, updated_at' do
      transaction = create(:transaction)

      expect(transaction).to respond_to(:credit_card_number)
      expect(transaction).to respond_to(:credit_card_expiration_date)
      expect(transaction).to respond_to(:result)
      expect(transaction).to respond_to(:invoice_id)
      expect(transaction).to respond_to(:created_at)
      expect(transaction).to respond_to(:updated_at)
    end
  end
end
