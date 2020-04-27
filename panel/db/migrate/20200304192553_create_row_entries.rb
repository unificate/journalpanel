class CreateRowEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :row_entries do |t|
      t.string :Table_Name
      t.references :microservice, null: false, foreign_key: true
      t.integer :record_id

      t.timestamps
    end
  end
end
