Rails.application.routes.draw do
  get 'view_organisation/index'
  get 'mentions_legales/index'
  get 'contact/index'
  resources :evaluations
  devise_for :users
  resources :organisations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
