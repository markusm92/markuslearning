Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :pages #Tää kun on lisätty, niin pitäisi näkyä index, show, new, create jne. Tarkista vielä.
    root to: "pages#index" #Tämän pitäisi asettaa niin, että /admin menee pages dashboardille.
  end

  resources :pages, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
