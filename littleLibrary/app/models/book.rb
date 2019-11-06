class Book < ApplicationRecord
  validates :author, presence: true
  validates :title, presence: true
  validates :available, presence: true
end
