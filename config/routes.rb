Rails.application.routes.draw do
  get 'dashboard/index'
  resources :evaluations
  devise_for :users, path: '', path_names: { sign_in: "connexion", sign_out: "déconnexion", sign_up: "inscription" }
  resources :organisations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  get "dashboard", to: "dashboard#index", as: "user_root"
end
