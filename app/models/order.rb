class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :shipping_address, class_name: "Address", optional: true
  belongs_to :billing_address, class_name: "Address", optional: true

  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items

  validates :order_number, presence: true, uniqueness: true
  validates :status, presence: true, inclusion: { in: %w[pending processing shipped delivered canceled] }
  validates :total_amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  before_validation :set_order_number, :set_order_date, on: :create

  scope :pending, -> { where(status: "pending") }
  scope :processing, -> { where(status: "processing") }
  scope :shipped, -> { where(status: "shipped") }
  scope :delivered, -> { where(status: "delivered") }
  scope :canceled, -> { where(status: "canceled") }

  private

  def set_order_number
    self.order_number ||= "ORD-#{SecureRandom.hex(5).upcase}"
  end

  def set_order_date
    self.order_date ||= Time.current
  end
end
