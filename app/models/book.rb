class Book < ApplicationRecord
  belongs_to :user
  has_many :shares
  validates :title, :description, :value, :shares, :category, presence: true
  validates :title, uniqueness: true

  acts_as_taggable_on :tags
end
