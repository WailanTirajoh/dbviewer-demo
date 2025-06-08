class Service < CompanyProfileRecord
  belongs_to :company

  validates :name, presence: true
  validates :description, presence: true
  validates :slug, presence: true, uniqueness: { scope: :company_id }

  before_validation :generate_slug, on: :create

  scope :featured, -> { where(featured: true) }
  scope :ordered, -> { order(display_order: :asc, created_at: :asc) }

  private

  def generate_slug
    self.slug ||= name.to_s.parameterize
  end
end
