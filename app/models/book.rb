class Book < ApplicationRecord
  belongs_to :user
  validates :title, :description, :value, :shares, presence: true
  # validates :title, uniqueness: true

  acts_as_taggable_on :tags
end
