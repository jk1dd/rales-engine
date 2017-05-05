class Transaction < ApplicationRecord
  belongs_to :invoice

  enum result: %w(failed success)

  scope :successful, -> {where(result: 'success')}
end
