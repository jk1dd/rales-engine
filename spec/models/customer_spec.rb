require 'rails_helper'

RSpec.describe Customer, type: :model do
  context 'attributes' do
    it 'has first name, last name, created_at, updated_at' do
      customer = create(:customer)

      expect(customer).to respond_to(:first_name)
      expect(customer).to respond_to(:last_name)
      expect(customer).to respond_to(:created_at)
      expect(customer).to respond_to(:updated_at)
    end
  end
end
