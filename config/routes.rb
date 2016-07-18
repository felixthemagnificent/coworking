Rails.application.routes.draw do
  resources :memberships
  resources :visits do
    member do
      get 'close_order'
    end
    collection do
      post ':id' => "visits#addmeal"
    end
  end
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
