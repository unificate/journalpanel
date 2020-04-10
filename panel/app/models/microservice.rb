class Microservice < ApplicationRecord
    has_many :row_entries, class_name: "RowEntry"
end
