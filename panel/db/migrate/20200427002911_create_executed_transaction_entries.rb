class CreateExecutedTransactionEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :executed_transaction_entries do |t|
      t.references :executed_at, null: false, foreign_key: true
      t.references :transaction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
