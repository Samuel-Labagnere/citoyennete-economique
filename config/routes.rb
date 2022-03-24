Rails.application.routes.draw do
  get 'admin/index'
  get 'dashboard/index'
  resources :evaluations
  devise_for :users
  resources :organisations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  get "dashboard", to: "dashboard#index", as: "user_root"
  get "admin", to: "admin#index"
end
