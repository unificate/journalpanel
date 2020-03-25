class Change < ApplicationRecord
  belongs_to :Row_Entry, optional: true
  belongs_to :Users, optional: true
end
