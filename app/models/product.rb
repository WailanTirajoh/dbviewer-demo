class Product < ApplicationRecord
  belongs_to :category
  has_many :order_items, dependent: :nullify
  has_many :orders, through: :order_items
  has_many :reviews, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :stock_quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :sku, presence: true, uniqueness: true, length: { maximum: 20 }
end
