class Company < CompanyProfileRecord
  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true

  has_many :posts, dependent: :destroy
  has_many :employees, dependent: :destroy
  has_many :testimonials, dependent: :destroy
  has_many :services, dependent: :destroy

  before_validation :generate_slug, on: :create

  private

  def generate_slug
    self.slug ||= name.to_s.parameterize
  end
end
