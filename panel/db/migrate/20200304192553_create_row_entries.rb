class CreateRowEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :row_entries do |t|
      t.string :Table_Name
      t.int :microservice_id
      t.int :record_id
      t.int :id

      t.timestamps
    end
  end
end
