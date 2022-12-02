class Book < ApplicationRecord
  belongs_to :user

  has_many :shares, dependent: :destroy
  validates :title, :description, :value, :total_amount, presence: true
  has_one_attached :photo

  acts_as_taggable_on :tags
end
