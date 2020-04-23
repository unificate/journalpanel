class TransactionEntry < ApplicationRecord
  has_one :change
  belongs_to :transaction
end
