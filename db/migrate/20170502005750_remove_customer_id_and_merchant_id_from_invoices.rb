class RemoveCustomerIdAndMerchantIdFromInvoices < ActiveRecord::Migration[5.0]
  def change
    remove_column :invoices, :customer_id, :integer
    remove_column :invoices, :merchant_id, :integer
  end
end
