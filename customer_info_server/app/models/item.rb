class Item < ApplicationRecord
    validates :name, presence:true, length: 1..200
end
