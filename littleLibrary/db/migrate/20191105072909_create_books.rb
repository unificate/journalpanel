class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.boolean :available
      t.string :checkout_date

      t.timestamps
    end
  end
end
