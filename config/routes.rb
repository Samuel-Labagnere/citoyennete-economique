Rails.application.routes.draw do
  namespace :admin do
    resources :evaluations
    root 'dashboard#index'
  end

  get '/evaluations_builder/new', to: 'evaluations_builder#new'
  get '/evaluations_builder/:evaluation_id/:id', to: 'evaluations_builder#show', as: 'evaluation_builder'
  put '/evaluations_builder/:evaluation_id/:id', to: 'evaluations_builder#update'

  devise_for :users, path: '', path_names: { sign_in: "connexion", sign_out: "deconnexion", sign_up: "inscription", edit: "compte" }
  resources :organisations

  get "admin", to: "admin#index"
  # get "entreprises", to: "organisations#public_list"
  get 'pilier-1', to: "statistiques#pillar1"
  get 'pilier-2', to: "statistiques#pillar2"
  get 'pilier-3', to: "statistiques#pillar3"
  get 'pilier-4', to: "statistiques#pillar4"
  get 'mentions-legales', to: "home#mentions_legales"
  get 'cgu', to: 'home#cgu'
  # get 'politique-de-confidentialite', to: 'home#politique'
  get 'contact', to: "contact#index"

  get 'code_invitation', to: "invitation_code#index"
  post 'code_invitation', to: "invitation_code#join"

  get 'resultats/:evaluation_id', to: "resultats#index", as: "resultats"
  root "home#index"
end
