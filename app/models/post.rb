class Post < CompanyProfileRecord
  belongs_to :company
  belongs_to :author, class_name: "Employee", optional: true

  has_many :comments, dependent: :destroy
  has_many :post_categories, dependent: :destroy
  has_many :categories, through: :post_categories, source: :category_profile

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: { scope: :company_id }
  validates :content, presence: true
  validates :status, presence: true, inclusion: { in: %w[draft published archived] }

  before_validation :generate_slug, on: :create

  scope :published, -> { where(status: "published") }
  scope :recent, -> { order(published_at: :desc) }

  private

  def generate_slug
    self.slug ||= title.to_s.parameterize
  end
end
