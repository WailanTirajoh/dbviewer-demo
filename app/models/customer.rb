class Customer < ApplicationRecord
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :nullify
  has_many :reviews, dependent: :nullify

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, :last_name, presence: true, length: { maximum: 50 }

  def full_name
    "#{first_name} #{last_name}"
  end
end
