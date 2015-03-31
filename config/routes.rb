Rails.application.routes.draw do

  root 'welcome#index'
  resources :users, except: [:index, :show, :edit] do
    resources :messages, only: [:new, :create] do
      get 'conversation', on: :collection
    end
  end

  resources :notifications, only: [:index] do
    put "read", on: :collection
  end

  resources :status_messages, only: [:index, :create, :delete, :new]


  resources :profiles, except: [:new] do
    get "random", on: :collection
  end

  resources :messages, only: [:index, :destroy] do
    get 'sent', on: :collection
  end

  resources :responses, only: [:create, :update, :edit]

  resources :photos, only: [:new, :create, :destroy]

  resource :user_filter, only: [:update]
  resource :session, only: [:new, :create, :destroy]

  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
