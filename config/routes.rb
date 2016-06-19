Rails.application.routes.draw do
  resources :memberships
  resources :visits
  resources :customers
  resources :orders
  resources :meals
  namespace :admin do
    resources :users
    root to: "users#index"
  end
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
