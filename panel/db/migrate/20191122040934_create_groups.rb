class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :username
      t.string :memberOf

      t.timestamps
    end
  end
end
