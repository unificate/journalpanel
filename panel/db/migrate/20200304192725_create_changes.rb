class CreateChanges < ActiveRecord::Migration[6.0]
  def change
    create_table :changes do |t|
      t.references :row_entry, null: false, foreign_key: true
      t.string :old_value
      t.string :new_value
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
