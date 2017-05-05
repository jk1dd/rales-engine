class Invoice < ApplicationRecord
  belongs_to :merchant
  belongs_to :customer
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  def self.item_best_day(item)
    best = select('invoices.created_at').
    joins(:invoice_items, :items).
    group('invoices.created_at').
    where('items.id = ?', item).
    order('sum(invoice_items.quantity) DESC, invoices.created_at DESC').first.created_at
    {best_day: best}
  end
end
