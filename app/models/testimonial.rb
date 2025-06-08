class Testimonial < CompanyProfileRecord
  belongs_to :company

  validates :author_name, presence: true
  validates :content, presence: true
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  scope :featured, -> { where(featured: true) }
end
