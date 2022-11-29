class Book < ApplicationRecord
  belongs_to :user
  validates :title, :description, :value, :shares, :category, :example, presence: true
  validates :title, uniqueness: true
end
