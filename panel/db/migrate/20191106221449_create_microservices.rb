class CreateMicroservices < ActiveRecord::Migration[6.0]
  def change
    create_table :microservices do |t|
      t.string :name

      t.timestamps
    end
  end
end
