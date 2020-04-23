class ChangeValuesToBeTextInExecuted < ActiveRecord::Migration[6.0]
  def change
    change_column :executed_ats, :old_value, :text
    change_column :executed_ats, :new_value, :text
  end
end
