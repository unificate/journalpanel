class CreateRowEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :row_entries do |t|
      t.string :Table_Name
      t.integer :microservice_id
      t.integer :record_id

      t.timestamps
    end
  end
end
