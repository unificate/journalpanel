class TransactionEntry < ApplicationRecord
  belongs_to :change, dependent: :destroy
end
