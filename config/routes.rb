Rails.application.routes.draw do
  devise_for :users

  resources :categories, only: [:index]
  resources :products, only: [:index]

  namespace :admin do
    root 'admin_panel#index'
    resources :admin_panel
    resources :users
    resources :categories
    resources :products
  end

  root to: 'home#index'
end