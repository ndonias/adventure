Rails.application.routes.draw do

  root 'welcome#index'
  resources :users

  resources :photos, only: [:new, :create, :destroy]

  resources :profiles

  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
