class Contact < ApplicationRecord
    validates :name, presence: true
    validates :phone_number, presence: true
    validates :company, presence: true
    validates :address, presence: true
end
