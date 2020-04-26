class CreateTransactionEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :transaction_entries do |t|
      t.references :change, null: false 
      t.references :transaction, null: false, foreign_key: {on_delete: :cascade}
      t.timestamps
    end
  end
end
