require 'rails_helper'

RSpec.describe Item, type: :model do
  context 'attributes' do
    it 'has name, description, unit_price, merchant_id, created_at, updated_at' do
      i = create(:item)

      expect(i).to respond_to(:name)
      expect(i).to respond_to(:description)
      expect(i).to respond_to(:merchant_id)
      expect(i).to respond_to(:unit_price)
      expect(i).to respond_to(:created_at)
      expect(i).to respond_to(:updated_at)
    end
  end
end
