# config/routes.rb

Rails.application.routes.draw do
  # -------------------------------
  # Devise routes for users
  # -------------------------------
  devise_for :users, controllers: { sessions: 'users/sessions' }

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
    resources :pages
    root to: "pages#index"
  end

  # -------------------------------
  # Public content pages (user-facing)
  # -------------------------------
  resources :pages, only: [:show, :index]

  # -------------------------------
  # Mount ActionText engine for serving attachments
  # Needed to render images in rich text
  # -------------------------------
  mount ActionText::Engine => '/action_text'
end
