Rails.application.routes.draw do

  root 'welcome#index'
  resources :users, except: [:index, :show, :edit]

  resources :profiles
  resources :photos, only: [:new, :create, :destroy]

  resource :user_filter, only: [:update]
  resource :session, only: [:new, :create, :destroy]

  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
