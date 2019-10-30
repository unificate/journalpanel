class Customer < ApplicationRecord
    validates :first, presence: true, length: 1..50
    validates :last, presence: true, length: 1..50
    validates :email, presence: true, length: 1..100
end
