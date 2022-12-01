class Book < ApplicationRecord
  belongs_to :user
  validates :title, :description, :value, :shares, presence: true
  
  has_one_attached :photo

  acts_as_taggable_on :tags
end
