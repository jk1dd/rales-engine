class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items


  # scope :ordered_by_created_at, -> { order(created_at: :asc)}
end
