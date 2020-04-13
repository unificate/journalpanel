class RowEntry < ApplicationRecord
    has_many :modifications, class_name: "Change"
    has_many :executed_ats
    belongs_to :microservice
end
