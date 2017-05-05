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

  def self.customer_with_pending(merchant)
    pendings = self.find_by_sql("SELECT customers.*, count(invoices.id)
                      FROM customers
                      JOIN invoices ON customers.id = invoices.customer_id
                      JOIN merchants ON merchants.id = invoices.merchant_id
                      JOIN transactions ON transactions.invoice_id = invoices.id
                      WHERE transactions.result = 'failed'
                      AND merchants.id = 77
                      GROUP BY customers.id
                      ORDER BY count(invoices.id) DESC;")
                  
  end
end
