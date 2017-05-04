class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.top_sold_quantity(limit)
    select('items.*, count(invoice_items.id) AS item_count').
    joins(invoice_items: [{invoice: :transactions}]).
    group('items.id').
    order('item_count DESC').
    limit(limit)
  end

end
