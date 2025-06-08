class Comment < CompanyProfileRecord
  belongs_to :post

  validates :author_name, presence: true
  validates :content, presence: true
  validates :status, presence: true, inclusion: { in: %w[pending approved rejected] }

  scope :approved, -> { where(status: "approved") }
  scope :pending, -> { where(status: "pending") }
end
