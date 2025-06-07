class Review < ApplicationRecord
  belongs_to :product
  belongs_to :customer

  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :comment, length: { maximum: 1000 }

  scope :positive, -> { where("rating >= ?", 4) }
  scope :negative, -> { where("rating <= ?", 2) }
  scope :neutral, -> { where(rating: 3) }
end
