Rails.application.routes.draw do

  get 'user_filters/create'

  root 'welcome#index'
  resources :users

  resources :photos, only: [:new, :create, :destroy]

  resources :profiles
  resource :user_filter, only: [:update]
  resource :session, only: [:new, :create, :destroy]

  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
