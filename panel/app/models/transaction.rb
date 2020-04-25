class Transaction < ApplicationRecord
  belongs_to :user
  has_many :transaction_entries
  has_many :modifications, :through => :transaction_entries, :source => :change
end
