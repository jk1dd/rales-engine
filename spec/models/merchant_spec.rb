require 'rails_helper'

RSpec.describe Merchant, type: :model do
  context 'attributes' do
    it 'has name, created_at, updated_at' do
      merchant = create(:merchant)

      expect(merchant).to respond_to(:name)
      expect(merchant).to respond_to(:created_at)
      expect(merchant).to respond_to(:updated_at)
    end
  end
end
