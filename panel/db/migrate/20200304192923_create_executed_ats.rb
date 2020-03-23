class CreateExecutedAts < ActiveRecord::Migration[6.0]
  def change
    create_table :executed_ats do |t|
      t.references :Row_Entry, null: false, foreign_key: true
      t.string :old_value
      t.string :new_value
      t.references :Users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
