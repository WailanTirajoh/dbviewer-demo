Rails.application.routes.draw do
  devise_for :users, skip: [ :registrations, :passwords ]

  # Redirect root to dbviewer if authenticated, otherwise to home page
  authenticated :user do
    root to: redirect("/dbviewer"), as: :authenticated_root
  end

  root to: "home#index"

  # root to: redirect("/dbviewer")

  # Mount Dbviewer with authentication constraint
  authenticate :user do
    mount Dbviewer::Engine => "/dbviewer"
  end

  # Health check endpoint
  get "/up", to: "rails/health#show"
end
