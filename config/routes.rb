Rails.application.routes.draw do
  resources :objectifs_lists
  resources :evaluations

  get '/evaluations_build/new', to: 'evaluations_build#new'
  get '/evaluations_build/:evaluation_id/:id', to: 'evaluations_build#show', as: 'evaluation_build'
  put '/evaluations_build/:evaluation_id/:id', to: 'evaluations_build#update'

  devise_for :users, path: '', path_names: { sign_in: "connexion", sign_out: "deconnexion", sign_up: "inscription", edit: "compte" }
  resources :organisations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  get "dashboard", to: "dashboard#index", as: "user_root"
  get "admin", to: "admin#index"
  # get "entreprises", to: "organisations#public_list"
  get 'pilier-1', to: "statistiques#pillar1"
  get 'pilier-2', to: "statistiques#pillar2"
  get 'pilier-3', to: "statistiques#pillar3"
  get 'pilier-4', to: "statistiques#pillar4"
  get 'mentions-legales', to: "home#mentions_legales"
  get 'cgu', to: 'home#cgu'
  get 'politique-de-confidentialite', to: 'home#politique'
  get 'contact', to: "contact#index"

  get 'code_invitation', to: "invitation_code#index"
  post 'code_invitation', to: "invitation_code#join"

  get 'resultats/:evaluation_id', to: "resultats#index", as: "resultats"
end
