class CompanyProfileRecord < ActiveRecord::Base
  self.abstract_class = true
  connects_to database: { writing: :company_profile, reading: :company_profile }
end
