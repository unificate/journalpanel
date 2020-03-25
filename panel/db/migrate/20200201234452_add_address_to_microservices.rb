class AddAddressToMicroservices < ActiveRecord::Migration[6.0]
  def change
    add_column :microservices, :address, :string
  end
end
