Rails.application.routes.draw do
  mount Dbviewer::Engine => "/dbviewer"

  # Redirect root to dbviewer
  root to: redirect("/dbviewer")

  # Health check endpoint
  get "/up", to: "rails/health#show"
end
