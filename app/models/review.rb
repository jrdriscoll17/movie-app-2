class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :rating, :content, presence: true
  validates :rating, numericality: { less_than: 6, greater_than: 0 }
  validates :content, uniqueness: true
end
