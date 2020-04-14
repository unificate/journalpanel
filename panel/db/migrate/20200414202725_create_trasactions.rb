class CreateTrasactions < ActiveRecord::Migration[6.0]
  def change
    create_table :trasactions do |t|
      t.references :User, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
