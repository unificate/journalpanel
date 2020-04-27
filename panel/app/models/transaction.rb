class Transaction < ApplicationRecord
  belongs_to :user
  has_many :transaction_entries, dependent: :destroy 
  has_many :modifications, :through => :transaction_entries, :source => :change
  has_many :executed_transaction_entries, dependent: :destroy
  has_many :executed_ats, :through => :executed_transaction_entries, :source => :executed_ats
end
