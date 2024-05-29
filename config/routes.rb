Rails.application.routes.draw do
  root "places#index"
  resources :entries
  resources :places
  resources :sessions
  resources :users, only: [:new, :create, :show]
end

