class Category < ApplicationRecord
  has_many :products, dependent: :nullify
  belongs_to :parent, class_name: "Category", optional: true
  has_many :subcategories, class_name: "Category", foreign_key: "parent_id", dependent: :nullify

  validates :name, presence: true, length: { maximum: 50 }
end
