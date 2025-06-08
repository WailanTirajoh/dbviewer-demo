# filepath: /Users/166612.wailan/dbviewer-demo/app/models/category.rb
class CategoryProfile < CompanyProfileRecord
  has_many :post_categories, foreign_key: "category_id", dependent: :destroy
  has_many :posts, through: :post_categories

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true

  before_validation :generate_slug, on: :create

  private

  def generate_slug
    self.slug ||= name.to_s.parameterize
  end
end
