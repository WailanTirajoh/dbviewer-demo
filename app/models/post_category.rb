class PostCategory < CompanyProfileRecord
  belongs_to :post
  belongs_to :category_profile, foreign_key: "category_id"
end
