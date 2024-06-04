Rails.application.routes.draw do
  root "places#index"
  resources :entries
  resources :places
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end

