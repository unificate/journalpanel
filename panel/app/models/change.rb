class Change < ApplicationRecord
  belongs_to :row_entry, optional: true
  belongs_to :user, optional: true
end
