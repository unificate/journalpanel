class RowEntry < ApplicationRecord
    has_many :changes
    has_many :executed_ats
end
