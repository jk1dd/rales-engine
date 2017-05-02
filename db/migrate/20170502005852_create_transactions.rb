class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.string :credit_card
      t.string :credit_card_expiration_date
      t.text :result
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
