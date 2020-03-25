class ExecutedAt < ApplicationRecord
  belongs_to :Row_Entry
  belongs_to :Users
end
