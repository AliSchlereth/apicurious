Rails.application.routes.draw do

  root 'home#index'
  get '/auth/github/callback', to: "sessions#create"
  delete '/logout', to: "sessions#destroy", as: 'logout'
  get '/repositories', to: "repo#index"
  get '/starred', to: "starred#index"
  get '/followers', to: "followers#index"
  get '/following', to: "following#index"
  resources :dashboard, only: [:index]


end
