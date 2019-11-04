class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :phone_number
      t.string :company
      t.string :address

      t.timestamps
    end
  end
end
