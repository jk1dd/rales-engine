class Customer < ApplicationRecord
  has_many :invoices

  def self.top_customer(merchant)
    joins(invoices: [:merchant, :transactions]).
    merge(Transaction.successful).
    where('merchants.id = ?', merchant).
    group('customers.id').
    order('count(transactions.invoice_id) DESC').
    limit(1)
  end
end
