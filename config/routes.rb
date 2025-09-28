Rails.application.routes.draw do
  get 'pages/show'
  devise_for :users

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
  resources :pages, only: [:show]
end
