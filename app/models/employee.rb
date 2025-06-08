class Employee < CompanyProfileRecord
  belongs_to :company
  has_many :posts, foreign_key: :author_id, dependent: :nullify

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { scope: :company_id }
  validates :position, presence: true

  scope :active, -> { where(active: true) }
end
