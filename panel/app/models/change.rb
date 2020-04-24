class Change < ApplicationRecord
  belongs_to :row_entry
  belongs_to :user, optional: true
  belongs_to :transaction, optional: true
end
