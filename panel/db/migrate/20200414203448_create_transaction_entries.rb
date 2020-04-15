class CreateTransactionEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :transaction_entries do |t|
      t.references :User
      t.references :Change, null: false, foreign_key: true

      t.timestamps
    end
  end
end
