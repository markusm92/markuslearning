Rails.application.routes.draw do
  # Use our custom sessions controller for Devise
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  # Homepage for logged-in users
  authenticated :user do
    root to: "home#index", as: :authenticated_root
  end

  # Public homepage (for visitors not logged in)
  unauthenticated do
    root to: "pages#show", id: 'welcome', as: :unauthenticated_root
  end

  # Admin namespace
  namespace :admin do
    resources :pages #Tää kun on lisätty, niin pitäisi näkyä index, show, new, create jne. Tarkista vielä.
    root to: "pages#index" #Tämän pitäisi asettaa niin, että /admin menee pages dashboardille.
  end

  # Public content pages (show only)
  resources :pages, only: [:show, :index] # <-- add :index here for user-facing pages
end
