Rails.application.routes.draw do
  devise_for :users

  resources :categories, only: [:index]
  resources :products, only: [:index]
  resources :purchases, only: [:index]
  get '/cart', to: 'purchase_items#index'
  resources :purchase_items, path: '/cart/items'

  get '/cart/checkout', to: 'purchases#new', as: :checkout
  patch '/cart/checkout', to: 'purchases#create'

  namespace :admin do
    root 'admin_panel#index'
    resources :admin_panel
    resources :users
    resources :categories
    get '/statistics', to: 'statistics#index'
    resources :products do
      collection { post :import }
    end
    resources :purchases
  end

  namespace :api do
    root 'products#index'
    resources :products
  end

  root to: 'home#index'
end