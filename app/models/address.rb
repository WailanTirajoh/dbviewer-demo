class Address < ApplicationRecord
  belongs_to :customer
  has_many :orders_as_shipping, class_name: "Order", foreign_key: "shipping_address_id", dependent: :nullify
  has_many :orders_as_billing, class_name: "Order", foreign_key: "billing_address_id", dependent: :nullify

  validates :address_type, presence: true, inclusion: { in: %w[shipping billing] }
  validates :street, :city, :state, :zip_code, :country, presence: true

  scope :shipping, -> { where(address_type: "shipping") }
  scope :billing, -> { where(address_type: "billing") }
  scope :default, -> { where(default: true) }
end
