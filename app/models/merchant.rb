class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  def self.total_revenue(merchant)
    merch_rev = self.find_by_sql("SELECT merchants.name, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue
                FROM merchants
                JOIN invoices ON merchants.id = invoices.merchant_id
                JOIN invoice_items ON invoices.id = invoice_items.invoice_id
                JOIN transactions ON transactions.invoice_id = invoices.id
                WHERE transactions.result = 'success'
                AND merchants.id = #{merchant}
                GROUP BY merchants.name;")

    { revenue: ((merch_rev[0].revenue)/100.00).to_s }
  end

  def self.top_revenue(limit)
    top_merchants = self.find_by_sql("SELECT merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue
                                      FROM merchants
                                      JOIN invoices on merchants.id = invoices.merchant_id
                                      JOIN invoice_items on invoices.id = invoice_items.invoice_id
                                      JOIN transactions on transactions.invoice_id = invoices.id
                                      WHERE transactions.result = 'success'
                                      GROUP BY merchants.id
                                      ORDER BY revenue DESC
                                      LIMIT(#{limit});")

  end

  def self.top_items_sold(limit)
    select('merchants.*, sum(invoice_items.quantity)AS total_items').
    joins(invoices: [:transactions, :invoice_items]).
    merge(Transaction.successful).
    group('merchants.id').
    order("total_items DESC").
    limit(limit)
  end

  def self.merchant_revenue_by_date(merchant, date)
    total_revenue = self.find_by_sql("SELECT sum(invoice_items.quantity * invoice_items.unit_price) AS revenue
                                      FROM merchants
                                      JOIN invoices ON invoices.merchant_id = merchants.id
                                      JOIN invoice_items ON invoice_items.invoice_id = invoices.id
                                      JOIN transactions on transactions.invoice_id = invoices.id
                                      WHERE transactions.result = 'success'
                                      AND merchants.id = #{merchant}
                                      AND invoices.created_at = '#{date}';")

    { revenue: ((total_revenue[0].revenue)/100.00).to_s }
  end

  def self.top_merchant(customer)
    joins(invoices: [:customer, :transactions]).
    merge(Transaction.successful).
    where('customers.id = ?', customer).
    group('merchants.id').
    order('count(transactions.invoice_id) DESC').
    limit(1)
  end
end
