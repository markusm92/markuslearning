Rails.application.routes.draw do
  # -------------------------------
  # Devise routes for user sessions
  # -------------------------------
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  # -------------------------------
  # ActiveStorage routes (required to serve attachments)
  # -------------------------------
  # This mounts all ActiveStorage routes needed for blobs, variants, and attachments
  # Must be placed **before any routes that might match /rails/active_storage/...**
  # so the requests are routed correctly.
  mount Rails.application.routes.url_helpers => "/rails/active_storage"

  # -------------------------------
  # Homepage for logged-in users
  # -------------------------------
  authenticated :user do
    root to: "home#index", as: :authenticated_root
  end

  # -------------------------------
  # Public homepage (for visitors not logged in)
  # -------------------------------
  unauthenticated do
    root to: "pages#show", id: 'welcome', as: :unauthenticated_root
  end

  # -------------------------------
  # Admin namespace
  # -------------------------------
  namespace :admin do
    resources :pages # index, show, new, create, edit, update, destroy
    root to: "pages#index" # /admin goes to pages dashboard
  end

  # -------------------------------
  # Public content pages (show only)
  # -------------------------------
  resources :pages, only: [:show, :index] # add index for listing pages
end