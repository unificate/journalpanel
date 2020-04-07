class ExecutedAt < ApplicationRecord
  belongs_to :row_entry
  belongs_to :user
end
