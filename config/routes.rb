Rails.application.routes.draw do
  # devise_for :users, skip: [ :registrations, :passwords ]

  # Redirect root to dbviewer if authenticated, otherwise to home page
  # authenticated :user do
  #   root to: redirect("/dbviewer"), as: :authenticated_root
  # end

  root to: "home#index"

  # root to: redirect("/dbviewer")

  # Mount Dbviewer with authentication constraint
  # authenticate :user do
  mount Dbviewer::Engine => "/dbviewer"
  # end

  # Health check endpoint
  get "/up", to: "rails/health#show"

  # Company Profile routes
  get "company-profiles", to: "company_profiles#index", as: "company_profiles"
  get "company-profiles/:slug", to: "company_profiles#show", as: "company_profile"
  get "company-profiles/:company_slug/posts", to: "company_profiles#posts", as: "company_posts"
  get "company-profiles/:company_slug/posts/:slug", to: "company_profiles#post", as: "company_post"
  get "company-profiles/:company_slug/employees", to: "company_profiles#employees", as: "company_employees"
  get "company-profiles/:company_slug/services", to: "company_profiles#services", as: "company_services"
  get "company-profiles/:company_slug/testimonials", to: "company_profiles#testimonials", as: "company_testimonials"
end
