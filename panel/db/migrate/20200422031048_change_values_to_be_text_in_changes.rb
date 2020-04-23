class ChangeValuesToBeTextInChanges < ActiveRecord::Migration[6.0]
  def change
    change_column :changes, :old_value, :text
    change_column :changes, :new_value, :text
  end
end
