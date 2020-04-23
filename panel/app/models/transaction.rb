class Transaction < ApplicationRecord
  belongs_to :users
  has_many :transaction_entries
  has_many :modifications, class_name: "Change", :through => :transaction_entries
end
